# homebrew-tap

Homebrew tap for:

| Formula | Description |
|---------|-------------|
| [exex](https://github.com/shellcell/exex) | Terminal UI for exploring ELF, Mach-O and PE binaries |
| [ttysvg](https://github.com/shellcell/ttysvg) | Record terminal sessions as SVG animations |
| [cnvrt](https://github.com/shellcell/cnvrt) | Interactive CLI for file conversion |
| [snailrace](https://github.com/shellcell/snailrace) | Benchmarking tool |

## Install

```sh
brew install shellcell/tap/exex
brew install shellcell/tap/ttysvg
brew install shellcell/tap/cnvrt
brew install shellcell/tap/snailrace
```

Or tap first, then install:

```sh
brew tap shellcell/tap
brew install exex
brew install ttysvg
brew install cnvrt
brew install snailrace
```

## Upgrade

```sh
brew upgrade exex
brew upgrade ttysvg
brew upgrade cnvrt
brew upgrade snailrace
```

## Supported platforms

| OS    | Architectures   |
|-------|-----------------|
| macOS | arm64, x86_64   |
| Linux | arm64, x86_64   |

The `exex` formula installs the **full** build (Chroma-based syntax highlighting).
The example config is installed under `$(brew --prefix)/share/exex/` and the
`README.md` under the formula's `doc` directory.

## Usage

```
exex [-debug PATH] [-s STRING] [-o [VIEW]] <binary> [goto]
```

See the upstream [README](https://github.com/shellcell/exex) for full
documentation, key bindings and the colour/theme schema.

```sh
ttysvg -o demo.svg
```

See the upstream [README](https://github.com/shellcell/ttysvg) for full ttysvg
documentation.

## Automation

- **CI** (`.github/workflows/ci.yml`): every PR and push to `main` runs
  `brew style` and `brew audit --strict --online` over all formulas.
- **Bumps** (`.github/workflows/bump.yml`): each project's release workflow
  sends a `repository_dispatch` (`bump-formula`) to this repo after publishing
  its assets. The workflow runs `scripts/bump-formula.sh`, which rewrites the
  `version` line and recomputes every `sha256` from the released archives, then
  opens a PR. It can also be run manually from the Actions tab.
- **livecheck**: every formula has a `livecheck` block, so
  `brew livecheck --tap shellcell/tap` reports new upstream versions.

### One-time setup

Create a PAT that can write to this repo (fine-grained: **Contents** and
**Pull requests** read/write on `shellcell/homebrew-tap`) and add it as an
Actions secret named `TAP_GITHUB_TOKEN` in:

- this repo (so bump PRs trigger the CI workflow — PRs opened with the default
  `GITHUB_TOKEN` don't start other workflows), and
- each project repo (`cnvrt`, `exex`, `snailrace`, `ttysvg`), whose release
  workflows use it to send the dispatch.
