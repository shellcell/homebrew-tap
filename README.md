# homebrew-tap

Homebrew tap for:

| Formula | Description |
|---------|-------------|
| [exex](https://github.com/rabarbra/exex) | Terminal UI for exploring ELF, Mach-O and PE binaries |
| [ttysvg](https://github.com/shellcell/ttysvg) | Record terminal sessions as SVG animations |
| [cnvrt](https://github.com/shellcell/cnvrt) | An interactive Go CLI for file conversion |
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

See the upstream [README](https://github.com/rabarbra/exex) for full
documentation, key bindings and the colour/theme schema.

```sh
ttysvg -o demo.svg
```

See the upstream [README](https://github.com/shellcell/ttysvg) for full ttysvg
documentation.
