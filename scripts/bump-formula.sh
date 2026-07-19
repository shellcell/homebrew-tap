#!/usr/bin/env bash
# Usage: bump-formula.sh <formula> <version>
#
# Rewrites Formula/<formula>.rb for a new release: updates the version line,
# then recomputes every sha256 by downloading the asset each url line resolves
# to. Relies on all urls interpolating #{version} and on each url line being
# followed by its own sha256 line, which holds for every formula in this tap.
set -euo pipefail

formula="${1:?usage: bump-formula.sh <formula> <version>}"
version="${2:?usage: bump-formula.sh <formula> <version>}"
version="${version#v}"
file="Formula/${formula}.rb"

[ -f "$file" ] || { echo "no such formula: $file" >&2; exit 1; }

sed -i -E "s|^([[:space:]]*version \")[^\"]+|\1${version}|" "$file"

mapfile -t urls < <(sed -nE 's/^[[:space:]]*url "([^"]+)".*/\1/p' "$file" \
                      | sed "s/#{version}/${version}/g")
[ "${#urls[@]}" -gt 0 ] || { echo "no url lines found in $file" >&2; exit 1; }

shas=()
for url in "${urls[@]}"; do
  echo "fetching $url" >&2
  shas+=("$(curl -fsSL --retry 3 "$url" | sha256sum | cut -d' ' -f1)")
done

awk -v shas="${shas[*]}" '
  BEGIN { n = split(shas, s, " ") }
  /^[[:space:]]*sha256 "/ { i++; sub(/"[0-9a-f]+"/, "\"" s[i] "\"") }
  { print }
  END {
    if (i != n) {
      print "found " i " sha256 lines for " n " urls" > "/dev/stderr"
      exit 1
    }
  }
' "$file" > "$file.tmp"
mv "$file.tmp" "$file"

echo "updated $file to v${version}"
