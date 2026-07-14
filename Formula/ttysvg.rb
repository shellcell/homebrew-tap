class Ttysvg < Formula
  desc "Record terminal sessions as SVG animations"
  homepage "https://github.com/shellcell/ttysvg"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shellcell/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_macos_arm64.tar.gz"
      sha256 "909fbcd1c0bc399481ec493440cb1135963e8adc42e32562f930be34722ba021"
    end

    on_intel do
      url "https://github.com/shellcell/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_macos_x86_64.tar.gz"
      sha256 "3ef9675fdf03defcea8494c8b8a84e36803334d4ed88d0a44d48b3bcdf46e1e3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shellcell/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_linux_arm64.tar.gz"
      sha256 "c24d171e6c049ec62d491e451a7b798a2882c0c7ea17f99904110b1ef9c83803"
    end

    on_intel do
      url "https://github.com/shellcell/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_linux_x86_64.tar.gz"
      sha256 "1fbcf340733fd23d03ad4091c788c5badfd0a4e69b1073d212b15b03172ec005"
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
