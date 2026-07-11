class Exex < Formula
  desc "Terminal UI for exploring ELF, Mach-O and PE binaries"
  homepage "https://github.com/rabarbra/exex"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-darwin-arm64.tar.gz"
      sha256 "11e81e09b1b33c577fe12ffc7e22c70320b1e814b94f6442ff93a7e2c11e8d8c"
    end
    on_intel do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-darwin-amd64.tar.gz"
      sha256 "c002d5484f554e4b48779f455427800e0f1cf3bf98cc79a529fbff9d93e16a2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-linux-arm64.tar.gz"
      sha256 "fc936b2c94c722c5deb386ace954e716838d302747181877fbb946f1f5bab889"
    end
    on_intel do
      url "https://github.com/rabarbra/exex/releases/download/v#{version}/exex-v#{version}-linux-amd64.tar.gz"
      sha256 "a57be5fb6bdff5b5d65cf0d7790e9e95de48acae5b3371a80fab2df61c6b03f8"
    end
  end

  def install
    bin.install "exex"
    pkgshare.install "config.example.yaml" if File.exist?("config.example.yaml")
    doc.install "README.md" if File.exist?("README.md")

    man1.install "exex.1" if File.exist?("exex.1")

    bash_completion.install "completions/exex.bash" => "exex" if File.exist?("completions/exex.bash")
    zsh_completion.install "completions/_exex" if File.exist?("completions/_exex")
    fish_completion.install "completions/exex.fish" if File.exist?("completions/exex.fish")
  end

  test do
    # exex can introspect any binary; point it at itself and check the info view.
    assert_match(/Format:\s+\S+/, shell_output("#{bin}/exex -o info #{bin}/exex"))
  end
end
