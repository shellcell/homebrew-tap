class Ttysvg < Formula
  desc "Record terminal sessions as SVG animations"
  homepage "https://github.com/shellcell/ttysvg"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shellcell/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_macos_arm64.tar.gz"
      sha256 "47f1cdbb2971ca19502add5a123d422ed6b9e74f6f5fc47690d5e1904572a62e"
    end

    on_intel do
      url "https://github.com/shellcell/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_macos_x86_64.tar.gz"
      sha256 "9ad6e755c0897d16929c14b8030e356649596ccfad1fd18645250c1095ce8dd8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shellcell/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_linux_arm64.tar.gz"
      sha256 "9164d5eca065c8abaef173426d6db925dd3803e12a5f5850c25e3217dc2ca40e"
    end

    on_intel do
      url "https://github.com/shellcell/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_linux_x86_64.tar.gz"
      sha256 "60e26bb90f07a13ff899865b055ee668cd59128f864640536daa886a6845dc6a"
    end
  end

  def install
    bin.install "ttysvg"
    man1.install "man/man1/ttysvg.1"

    bash_completion.install "completions/ttysvg.bash" => "ttysvg"
    zsh_completion.install "completions/_ttysvg"
    fish_completion.install "completions/ttysvg.fish"
  end

  test do
    assert_match "ttysvg v#{version}", shell_output("#{bin}/ttysvg --version")
  end
end
