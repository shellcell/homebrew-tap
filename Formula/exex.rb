class Exex < Formula
  desc "Terminal UI for exploring ELF, Mach-O and PE binaries"
  homepage "https://github.com/shellcell/exex"
  version "0.3.2"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/shellcell/exex/releases/download/v#{version}/exex-v#{version}-darwin-arm64.tar.gz"
      sha256 "09b62f39c2a4aec84b965930b908db597a736d10c86da4b4856b97e27bf72f8f"
    end
    on_intel do
      url "https://github.com/shellcell/exex/releases/download/v#{version}/exex-v#{version}-darwin-amd64.tar.gz"
      sha256 "75d697fb126f5c1ae2f15ee9eb6d1f3301ce5c542d329c48bc1706e94ea7fab2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shellcell/exex/releases/download/v#{version}/exex-v#{version}-linux-arm64.tar.gz"
      sha256 "dd0ea08f1ce8d91bbf6560f6f2eea9fb31548ea1f3376da6f7b7cf5ba1855fd9"
    end
    on_intel do
      url "https://github.com/shellcell/exex/releases/download/v#{version}/exex-v#{version}-linux-amd64.tar.gz"
      sha256 "b19c025e36f79c492143390bf04c4008da8a879d1fc6b234440a9a97f000f853"
    end
  end

  def install
    bin.install "exex"
    pkgshare.install "config.example.yaml" if File.exist?("config.example.yaml")
    doc.install "README.md" if File.exist?("README.md")

    man1.install "exex.1" if File.exist?("exex.1")
    man1.install "man/man1/exex.1" if File.exist?("man/man1/exex.1")

    bash_completion.install "completions/exex.bash" => "exex" if File.exist?("completions/exex.bash")
    zsh_completion.install "completions/_exex" if File.exist?("completions/_exex")
    fish_completion.install "completions/exex.fish" if File.exist?("completions/exex.fish")
  end

  test do
    # exex can introspect any binary; point it at itself and check the info view.
    assert_match(/Format:\s+\S+/, shell_output("#{bin}/exex -o info #{bin}/exex"))
  end
end
