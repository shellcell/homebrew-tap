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

[[ -f "${file}" ]] || {
  echo "no such formula: ${file}" >&2
  exit 1
}

sed -i -E "s|^([[:space:]]*version \")[^\"]+|\1${version}|" "${file}"

url_lines="$(sed -nE 's/^[[:space:]]*url "([^"]+)".*/\1/p' "${file}")"
url_lines="${url_lines//"#{version}"/${version}}"
[[ -n "${url_lines}" ]] || {
  echo "no url lines found in ${file}" >&2
  exit 1
}
mapfile -t urls <<<"${url_lines}"

shas=()
for url in "${urls[@]}"
do
  echo "fetching ${url}" >&2
  sha="$(curl -fsSL --retry 3 "${url}" | sha256sum | cut -d' ' -f1)"
  shas+=("${sha}")
done

count=0
tmp="${file}.tmp"
: >"${tmp}"
while IFS= read -r line
do
  if [[ "${line}" =~ ^[[:space:]]*sha256\ \" ]]
  then
    line="${line/\"*\"/\"${shas[count]}\"}"
    count=$((count + 1))
  fi
  printf '%s\n' "${line}" >>"${tmp}"
done <"${file}"

[[ "${count}" -eq "${#shas[@]}" ]] || {
  echo "found ${count} sha256 lines for ${#shas[@]} urls" >&2
  rm -f "${tmp}"
  exit 1
}
mv "${tmp}" "${file}"

echo "updated ${file} to v${version}"
