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
      sha256 "122f23c3e7ab1e829927062ae92261ed4c8d82b2104e1d2de3be433b66c62ca7"
    end

    on_intel do
      url "https://github.com/shellcell/ttysvg/releases/download/v#{version}/ttysvg-v#{version}-darwin-amd64.tar.gz"
      sha256 "9439d2ce75c180fdcaa3cdb1e262526525d3762afa7ddf250373c9cff8c0ab5a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shellcell/ttysvg/releases/download/v#{version}/ttysvg-v#{version}-linux-arm64.tar.gz"
      sha256 "83ec4c913e2339efdc7d02034be360cbbe46b4794678533c0d15b545152beebe"
    end

    on_intel do
      url "https://github.com/shellcell/ttysvg/releases/download/v#{version}/ttysvg-v#{version}-linux-amd64.tar.gz"
      sha256 "879c0e74357fc71673c7aa99570a41731d81d44d8b3476d93a3d23bd2716bd1f"
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
