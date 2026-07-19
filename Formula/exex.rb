class Exex < Formula
  desc "Terminal UI for exploring ELF, Mach-O and PE binaries"
  homepage "https://github.com/shellcell/exex"
  version "0.3.1"
  license "MIT"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/shellcell/exex/releases/download/v#{version}/exex-v#{version}-darwin-arm64.tar.gz"
      sha256 "bd4d6a67c0cf005300f866a5119dad4e4557ffc8b0f0661b9ced029d4bcbc47a"
    end
    on_intel do
      url "https://github.com/shellcell/exex/releases/download/v#{version}/exex-v#{version}-darwin-amd64.tar.gz"
      sha256 "26ac9567ae86a752b036c03ee48849729ef780bccd0ff611840d5f50e9232cd0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shellcell/exex/releases/download/v#{version}/exex-v#{version}-linux-arm64.tar.gz"
      sha256 "3e92e3a155264a587155c273866edc6d479990023109d89793da909fab526fd3"
    end
    on_intel do
      url "https://github.com/shellcell/exex/releases/download/v#{version}/exex-v#{version}-linux-amd64.tar.gz"
      sha256 "a87275adc2440df2c75bf4401c71e74cc7da62b1b3bef33e47a7d8fbe196af19"
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
