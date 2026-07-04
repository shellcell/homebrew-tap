class Ttysvg < Formula
  desc "Record terminal sessions as SVG animations"
  homepage "https://github.com/rabarbra/ttysvg"
  version "0.0.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_macos_arm64.tar.gz"
      sha256 "c9b9f1cd7f6307ec03fac970224409e686147e44179df27061e877fe93d39373"
    end

    on_intel do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_macos_x86_64.tar.gz"
      sha256 "50ae6da169249a75db7e6238c635980a17d28c7da93ed3b74fb7863169b76c4e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_linux_arm64.tar.gz"
      sha256 "565a725e1f3044454a2d3c98da476fa46c785683cd6aa29e9dc33e7960745e34"
    end

    on_intel do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_linux_x86_64.tar.gz"
      sha256 "1beb58ae95578514f0a3745b56f24948fe3f199a634047529a3a4a9a92c408a9"
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
