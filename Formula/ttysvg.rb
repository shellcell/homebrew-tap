class Ttysvg < Formula
  desc "Record terminal sessions as SVG animations"
  homepage "https://github.com/rabarbra/ttysvg"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_macos_arm64.tar.gz"
      sha256 "d2e2a6b2626b56d7ba179957fa97c002160a9e4afca84846a3fb7fbcad363913"
    end

    on_intel do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_macos_x86_64.tar.gz"
      sha256 "3cba1bffda1182e6722ec02e059731a5e46fab05f7da0e1f25868a72e6f2f51b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_linux_arm64.tar.gz"
      sha256 "8581c22239614dc1ae0a68ac34fcbd06b51c5617667bd5b14503a5c3225c06c0"
    end

    on_intel do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_linux_x86_64.tar.gz"
      sha256 "9a8b83e7be3adaf9144725186dcd39f3ad34be614d693fecc394604f7b6342ab"
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
