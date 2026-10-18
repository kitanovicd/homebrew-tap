class Blindspot < Formula
  desc "Find gaps in Foundry tests with Solidity mutation testing"
  homepage "https://github.com/kitanovicd/blindspot"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.2.0/blindspot_darwin_arm64.tar.gz"
      sha256 "6eea59f4f28aaaf8504d0c40e51db562cf56b02b2afa1a39391c54fdc7ec02c0"
    end

    on_intel do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.2.0/blindspot_darwin_amd64.tar.gz"
      sha256 "5b55507b010124e0829c87a8c0aaff9dab989cc9ca1cf1fa95144ad07aece35d"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.2.0/blindspot_linux_amd64.tar.gz"
      sha256 "8e542a9bf99b98f97d93cfd2fa655b2722dacb9755924bbb70f49c750fb779b6"
    end
  end

  def install
    bin.install "blindspot"
    doc.install "LICENSE", "GO_LICENSE", "THIRD_PARTY_NOTICES.md"
  end

  def caveats
    <<~EOS
      Requires Foundry (forge) on your PATH.

      Start guided setup:
        blindspot

      It asks for your project and install, build, and test commands.
    EOS
  end
end
