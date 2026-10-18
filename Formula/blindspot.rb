class Blindspot < Formula
  desc "Find gaps in Foundry tests with Solidity mutation testing"
  homepage "https://github.com/kitanovicd/blindspot"
  version "0.2.1"
  license "MIT"

  bottle do
    root_url "https://github.com/kitanovicd/homebrew-tap/releases/download/v0.2.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "71da4a39469fa5500817daa50a2414668c47b343d9f6a1332f7b3b0f88a58379"
    sha256 cellar: :any_skip_relocation, sequoia:       "3258c04d5534f918fc33ec4a8e726997f1a93776fc5b95c9acf2c0b90add3742"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1fb3dd5f699672ed715aa492bf5fd3253bae9fe68c70f0814a81976f44149716"
  end

  on_macos do
    on_arm do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.2.1/blindspot_darwin_arm64.tar.gz"
      sha256 "5f3a796f4dc544ac82ee6df22f15ff0a4b3e7abbb867473cf57fe09f0b565cfa"
    end

    on_intel do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.2.1/blindspot_darwin_amd64.tar.gz"
      sha256 "aacbb9a95bbd73452f4255ba7e103bacafb1418625a9151eeb4c2cf2534c2dd2"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.2.1/blindspot_linux_amd64.tar.gz"
      sha256 "e95ed6abc7cca2bc82e301ccaa03d232d32941cded2ba2a7af1434a868132169"
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
