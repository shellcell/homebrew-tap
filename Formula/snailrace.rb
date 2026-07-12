class Snailrace < Formula
  desc "Benchmarking tool"
  homepage "https://github.com/shellcell/snailrace"
  version "0.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-darwin-arm64.tar.gz"
      sha256 "67b43bc12d7ddaab6c8c9e68b43399c1a2fc874ae38d363f173e1d250f4718d0"
    end

    on_intel do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-darwin-amd64.tar.gz"
      sha256 "25fefa0f49d31c1f97ab3265a2b24856098f10777e413112389bef01ed84ac4c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-linux-arm64.tar.gz"
      sha256 "c917cc25bd7af208aa0f32dfe4eb82722e68b54ce78ef4b034551fbc3d5fb507"
    end

    on_intel do
      url "https://github.com/shellcell/snailrace/releases/download/v#{version}/snailrace-v#{version}-linux-amd64.tar.gz"
      sha256 "006e7c0dc8e496999669f4dd3a6cc3a2b45f22f03cf5d270834f117d4aed373e"
    end
  end

  def install
    bin.install "snailrace"
  end
end
