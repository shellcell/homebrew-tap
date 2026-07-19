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
      sha256 "50b58155c055aa550975c6738d618bbdc4a0e7bea7f6f359da809d175af25bb8"
    end
    on_intel do
      url "https://github.com/shellcell/exex/releases/download/v#{version}/exex-v#{version}-darwin-amd64.tar.gz"
      sha256 "8321398e8c1517480fa951b1e7a8362f1fda88fb33403dd4bfbf417fc97595ba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shellcell/exex/releases/download/v#{version}/exex-v#{version}-linux-arm64.tar.gz"
      sha256 "897337eed7b20beac91dbb3f5eb404b7779b8873cab6406df585b16ec20b033f"
    end
    on_intel do
      url "https://github.com/shellcell/exex/releases/download/v#{version}/exex-v#{version}-linux-amd64.tar.gz"
      sha256 "80c60feed69a24edc9eed34d7f1b0a56cd893789c85972686b3e21f2b56d058a"
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
