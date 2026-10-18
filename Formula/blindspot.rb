class Blindspot < Formula
  desc "Find gaps in Foundry tests with Solidity mutation testing"
  homepage "https://github.com/kitanovicd/blindspot"
  version "0.3.0"
  license "MIT"

  bottle do
    root_url "https://github.com/kitanovicd/homebrew-tap/releases/download/v0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d24e0a2626058091a0d135521c56cbb61746123fe986f4c4608033a6de1306e3"
    sha256 cellar: :any_skip_relocation, sequoia:       "a844bf154f0dd622473f69e5dc4f50831ff6d30853bc45ac2b2b28a2907d3434"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ec6fbe7b33cb282c7b425d319add0ffbf760d5a06b4b60731b04551c34e3c842"
  end

  on_macos do
    on_arm do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.3.0/blindspot_darwin_arm64.tar.gz"
      sha256 "725d87d658d9d3fe6d0cebe80c4451927508b75a8400ca6aa0580e45e6e470c3"
    end

    on_intel do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.3.0/blindspot_darwin_amd64.tar.gz"
      sha256 "2edab06f09b20dfa48daba6a48e118755649fe758a471c5f2618f659e0615673"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.3.0/blindspot_linux_amd64.tar.gz"
      sha256 "c106ee9529e3be1f33e2521151fb7ca3acb20aa54c9a934c111ad518869a8cff"
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
