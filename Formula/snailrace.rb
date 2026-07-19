class Snailrace < Formula
  desc "Benchmarking tool"
  homepage "https://github.com/shellcell/snailrace"
  version "0.0.3"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-darwin-arm64.tar.gz"
      sha256 "4142651b97535e6374f40533342e3b162f8d35500d2677af0b8c1edee3850650"
    end

    on_intel do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-darwin-amd64.tar.gz"
      sha256 "cf0231c181cdc104ec5679b232c850271a480d26dd92a125d73116e7889ed83d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-linux-arm64.tar.gz"
      sha256 "ce72decb4dce8a580224f1b03dc5c3f5ee31b78bfc2f7969b24b413c5a5dd5e3"
    end

    on_intel do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-linux-amd64.tar.gz"
      sha256 "b5e00beb90d3ab8db5a51984f355c1b7ad2b94c5fde75f7b37933ae476bd7aec"
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
