class Cnvrt < Formula
  desc "An interactive Go CLI for file conversion"
  homepage "https://github.com/shellcell/convert"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shellcell/convert/releases/download/v#{version}/convert_v#{version}_macos_arm64.tar.gz"
      sha256 "4449c7048d18390e373fdad0afa758da81c8d0167ea4816d1d3baee48c72a3c9"
    end

    on_intel do
      url "https://github.com/shellcell/convert/releases/download/v#{version}/convert_v#{version}_macos_x86_64.tar.gz"
      sha256 "37bcf3ba2e4d6a03ffc0b7d208420fad496671a2872058f26b70afe2082f7e18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shellcell/convert/releases/download/v#{version}/convert_v#{version}_linux_arm64.tar.gz"
      sha256 "5bd82fcafaa30637b6d822ba08b72fe56a08bd03f05af2c79d061cc7092b7fa5"
    end

    on_intel do
      url "https://github.com/shellcell/convert/releases/download/v#{version}/convert_v#{version}_linux_x86_64.tar.gz"
      sha256 "eebc64a3f1e12a6e99c0bf22db9587e7433c6e3121bdb3545f4148743dc32af8"
    end
  end

  def install
    bin.install "convert" => "cnvrt"
  end
end
