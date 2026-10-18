class Blindspot < Formula
  desc "Find gaps in Foundry tests with Solidity mutation testing"
  homepage "https://github.com/kitanovicd/blindspot"
  version "0.2.0"
  license "MIT"

  bottle do
    root_url "https://github.com/kitanovicd/homebrew-tap/releases/download/v0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "082f1639d959ff0cbb0aad39a9c66cf58b79c7e418b6bf0035b32e26542fcd33"
    sha256 cellar: :any_skip_relocation, sequoia:       "03891961b38844f8daba49325b9b4e7fbaf420839b6c0c34dd2e3fd9d3fc5119"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8872afa7c4cbed825315ac45cf4345291407aa102b54d392b995a773af93a149"
  end

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
