class Ttysvg < Formula
  desc "Record terminal sessions as SVG animations"
  homepage "https://github.com/rabarbra/ttysvg"
  version "0.0.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_macos_arm64.tar.gz"
      sha256 "a289131848743cbf0eaf207384896539db939d71e73a4376d109ff9c04235bca"
    end

    on_intel do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_macos_x86_64.tar.gz"
      sha256 "f853f7ff8aa788cfce5d32b5a71389c975792128ff496cfb8064549ba7d85701"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_linux_arm64.tar.gz"
      sha256 "102b95a2d1218d3469516a38024e16e400dfc7c713f1141385eae9599132c41a"
    end

    on_intel do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_linux_x86_64.tar.gz"
      sha256 "aca6ce789c05ec13a7ce7c0683375a2851700593c7d35d65232ea518f806b0b5"
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
