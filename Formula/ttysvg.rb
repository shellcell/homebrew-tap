class Ttysvg < Formula
  desc "Record terminal sessions as SVG animations"
  homepage "https://github.com/shellcell/ttysvg"
  version "0.1.2"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/shellcell/ttysvg/releases/download/v#{version}/ttysvg-v#{version}-darwin-arm64.tar.gz"
      sha256 "9254cbfeb57c2534f8308316eaea22bfec6015706c3cbb2b5f955c21af2102d8"
    end

    on_intel do
      url "https://github.com/shellcell/ttysvg/releases/download/v#{version}/ttysvg-v#{version}-darwin-amd64.tar.gz"
      sha256 "8aa298b62f125c64760f9527064943b4e90d31c4fd5601c1b07419e32c25f0e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shellcell/ttysvg/releases/download/v#{version}/ttysvg-v#{version}-linux-arm64.tar.gz"
      sha256 "878e0f8ac965c81bab4ec408591fcedea117a181948ccfd1df89265c09186c4f"
    end

    on_intel do
      url "https://github.com/shellcell/ttysvg/releases/download/v#{version}/ttysvg-v#{version}-linux-amd64.tar.gz"
      sha256 "e7ccf3d805c079a5ef7428553e49c8b4621de0ec7cd146f85fe670a5d1706057"
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
