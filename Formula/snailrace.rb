class Snailrace < Formula
  desc "Benchmarking tool"
  homepage "https://github.com/shellcell/snailrace"
  version "0.0.5"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-darwin-arm64.tar.gz"
      sha256 "ef6277d2cee69c30a4bfce45ad512b1c762fa7c9767c4eb504405125e1977163"
    end

    on_intel do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-darwin-amd64.tar.gz"
      sha256 "94bb5ebc504162b41d60e6b9467abf992d9fab38339f721a5cfc42753fa2f4ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-linux-arm64.tar.gz"
      sha256 "320b53fef4087f1b6749604b98a8f16f36655312cefef1db05eef4da9d34d8b5"
    end

    on_intel do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-linux-amd64.tar.gz"
      sha256 "28ea67c1849b697b87e444a606ba9e1d1a061259c51803d76882b9af8c165d00"
    end
  end

  def install
    bin.install "snailrace"
    man1.install "man/man1/snailrace.1" if File.exist?("man/man1/snailrace.1")

    bash_completion.install "completions/snailrace.bash" => "snailrace"
    zsh_completion.install "completions/_snailrace"
    fish_completion.install "completions/snailrace.fish"
  end
end
