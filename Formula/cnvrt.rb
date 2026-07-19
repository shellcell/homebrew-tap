class Cnvrt < Formula
  desc "Interactive CLI for file conversion"
  homepage "https://github.com/shellcell/cnvrt"
  version "0.0.1"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/shellcell/cnvrt/releases/download/v#{version}/cnvrt-v#{version}-darwin-arm64.tar.gz"
      sha256 "4449c7048d18390e373fdad0afa758da81c8d0167ea4816d1d3baee48c72a3c9"
    end

    on_intel do
      url "https://github.com/shellcell/cnvrt/releases/download/v#{version}/cnvrt-v#{version}-darwin-amd64.tar.gz"
      sha256 "37bcf3ba2e4d6a03ffc0b7d208420fad496671a2872058f26b70afe2082f7e18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shellcell/cnvrt/releases/download/v#{version}/cnvrt-v#{version}-linux-arm64.tar.gz"
      sha256 "5bd82fcafaa30637b6d822ba08b72fe56a08bd03f05af2c79d061cc7092b7fa5"
    end

    on_intel do
      url "https://github.com/shellcell/cnvrt/releases/download/v#{version}/cnvrt-v#{version}-linux-amd64.tar.gz"
      sha256 "eebc64a3f1e12a6e99c0bf22db9587e7433c6e3121bdb3545f4148743dc32af8"
    end
  end

  def install
    bin.install "cnvrt"
    man1.install "man/man1/cnvrt.1"

    bash_completion.install "completions/cnvrt.bash" => "cnvrt"
    zsh_completion.install "completions/_cnvrt"
    fish_completion.install "completions/cnvrt.fish"
  end

  test do
    assert_match "cnvrt v#{version}", shell_output("#{bin}/cnvrt --version")
  end
end
