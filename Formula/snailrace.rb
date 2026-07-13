class Snailrace < Formula
  desc "Benchmarking tool"
  homepage "https://github.com/shellcell/snailrace"
  version "0.0.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-darwin-arm64.tar.gz"
      sha256 "0f3aa96df1f73227eeb6aeacb7966eac4fa56cda31268800a09b4000112ca799"
    end

    on_intel do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-darwin-amd64.tar.gz"
      sha256 "a16503bba47e97a80533df4f296b4e74d2dd9132e4f01afaef7abb8d740524b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-linux-arm64.tar.gz"
      sha256 "5d3085707de3dc1503d5edae9281f7c49fcbc486113d960047fa7a1509aae559"
    end

    on_intel do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-linux-amd64.tar.gz"
      sha256 "e356d0ff4758a48d4c38a5b92c178b722c6cc8dff1f947b676f1039adaf1b794"
    end
  end

  def install
    bin.install "snailrace"
    
    bash_completion.install "completions/snailrace.bash" => "snailrace"
    zsh_completion.install "completions/_snailrace"
    fish_completion.install "completions/snailrace.fish"
  end
end
