class Cnvrt < Formula
  desc "Interactive CLI for file conversion"
  homepage "https://github.com/shellcell/cnvrt"
  version "0.0.2"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/shellcell/cnvrt/releases/download/v#{version}/cnvrt-v#{version}-darwin-arm64.tar.gz"
      sha256 "371431d0ef8fd3d2f07d2d9e7e3369d734be2733bbe6da4ba1b00854d3ce1617"
    end

    on_intel do
      url "https://github.com/shellcell/cnvrt/releases/download/v#{version}/cnvrt-v#{version}-darwin-amd64.tar.gz"
      sha256 "6e2fc4fc6cf762893ab7b85f3444d5899786c04fcf1f809524af8953d6fb2e3d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shellcell/cnvrt/releases/download/v#{version}/cnvrt-v#{version}-linux-arm64.tar.gz"
      sha256 "eaaa8cd273585360c78b94162ddcefda30159e77dd48697f0fceb610b24f3b4e"
    end

    on_intel do
      url "https://github.com/shellcell/cnvrt/releases/download/v#{version}/cnvrt-v#{version}-linux-amd64.tar.gz"
      sha256 "6e0e18815afe900562f3e4bfb3c3fbd40ed1fcfdbfda80b735ff80bb53cc50f7"
    end
  end

  def install
    bin.install "cnvrt"
    man1.install "man/man1/cnvrt.1"

    bash_completion.install "completions/cnvrt.bash" => "cnvrt"
    zsh_completion.install "completions/_cnvrt"
    fish_completion.install "completions/cnvrt.fish"
  end

  test do
    assert_match "cnvrt v#{version}", shell_output("#{bin}/cnvrt --version")
  end
end
