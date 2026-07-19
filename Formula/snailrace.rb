class Snailrace < Formula
  desc "Benchmarking tool"
  homepage "https://github.com/shellcell/snailrace"
  version "0.0.4"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-darwin-arm64.tar.gz"
      sha256 "c6c3fdee58fbfc862a54a2dfeb459b3d5b9283e3966803218f5336da943dce02"
    end

    on_intel do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-darwin-amd64.tar.gz"
      sha256 "c1e376a49cf57e296eda8f2687caa1c93461d1a9586fbe81f34b6a91877c13aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-linux-arm64.tar.gz"
      sha256 "728b1d42cd55cff85fe893bd66a245deae6c75469e2aca53303817acc1cfdd6f"
    end

    on_intel do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-linux-amd64.tar.gz"
      sha256 "321023cd201320143016a962f95ea06cb085de00f97379e3aa32f87cb3db3db5"
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
