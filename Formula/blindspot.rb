class Blindspot < Formula
  desc "Find gaps in Foundry tests with Solidity mutation testing"
  homepage "https://github.com/kitanovicd/blindspot"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.3.2/blindspot_darwin_arm64.tar.gz"
      sha256 "913e6a8cd1567e34b5bdce863a281db47b656b396d8de1f66984e16f0ecd1da2"
    end

    on_intel do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.3.2/blindspot_darwin_amd64.tar.gz"
      sha256 "77560b926b1bf1c778168f6288029d8590c173f62e253b0ee2d66d16faaa5524"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.3.2/blindspot_linux_amd64.tar.gz"
      sha256 "8a266c87c9865d47e2da41e6573b146c51f4ca95810d28e977afcd26c48f2db2"
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
