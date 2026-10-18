class Blindspot < Formula
  desc "Find gaps in Foundry tests with Solidity mutation testing"
  homepage "https://github.com/kitanovicd/blindspot"
  version "0.3.1"
  license "MIT"

  bottle do
    root_url "https://github.com/kitanovicd/homebrew-tap/releases/download/v0.3.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "725957466248dcb601d45ce07ccc810a4eae4ef5e459d5db84e2d70ebcb280b4"
    sha256 cellar: :any_skip_relocation, sequoia:       "b6d7a55ec01964d0805dfc8c5ce88de60d31303da82765ac5085a86656c6badc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e040286b31f46b05486ba7d27ca1943cb1301cccae62e3ef8001f7b5a602e572"
  end

  on_macos do
    on_arm do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.3.1/blindspot_darwin_arm64.tar.gz"
      sha256 "c336c3de69eaf5e9d53756cc5401e77062757e5d67b042444371da402a8f8c3f"
    end

    on_intel do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.3.1/blindspot_darwin_amd64.tar.gz"
      sha256 "b7d98256803caedbe2b0ec3afbabf075cdd315cbf21c74787e26f8852a16a690"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.3.1/blindspot_linux_amd64.tar.gz"
      sha256 "00be7ca9f82dfc4ce96f88fb9bc08c686ef464174f529e73e9e5beec716d20ad"
    end
  end

  def install
    bin.install "blindspot"
    doc.install "LICENSE", "GO_LICENSE", "THIRD_PARTY_NOTICES.md"
  end

  def caveats
    <<~EOS
      Requires Foundry (forge) on your PATH.

      Open the menu:
        blindspot

      Run mutation tests, free up space, or browse saved reports.
    EOS
  end
end
