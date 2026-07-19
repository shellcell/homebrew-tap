class Cnvrt < Formula
  desc "Interactive CLI for file conversion"
  homepage "https://github.com/shellcell/cnvrt"
  version "0.0.3"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/shellcell/cnvrt/releases/download/v#{version}/cnvrt-v#{version}-darwin-arm64.tar.gz"
      sha256 "97c649c19e38203a3a9258d45c7469784dcdbe400109f9ac6c541d30e8a79636"
    end

    on_intel do
      url "https://github.com/shellcell/cnvrt/releases/download/v#{version}/cnvrt-v#{version}-darwin-amd64.tar.gz"
      sha256 "71ff065a17e624f73b51998401b6a12c04877cdab80fc3af45584e2d5c7a6ebe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shellcell/cnvrt/releases/download/v#{version}/cnvrt-v#{version}-linux-arm64.tar.gz"
      sha256 "051c3761276e218ba0431efd45611fa733f60e6fd0ae60375ab4539470776535"
    end

    on_intel do
      url "https://github.com/shellcell/cnvrt/releases/download/v#{version}/cnvrt-v#{version}-linux-amd64.tar.gz"
      sha256 "516f757dbb13163b573fb26cbf36bc157d7361936ab9928ab8996b9b09cb68bf"
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
