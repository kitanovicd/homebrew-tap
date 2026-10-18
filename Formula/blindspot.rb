class Blindspot < Formula
  desc "Find gaps in Foundry tests with Solidity mutation testing"
  homepage "https://github.com/kitanovicd/blindspot"
  version "0.2.1"
  license "MIT"

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
