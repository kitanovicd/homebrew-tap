class Blindspot < Formula
  desc "Find gaps in Foundry tests with Solidity mutation testing"
  homepage "https://github.com/kitanovicd/blindspot"
  version "0.1.0"
  license "MIT"

  bottle do
    root_url "https://github.com/kitanovicd/homebrew-tap/releases/download/v0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fd54d917b52840d1eb68b84c6550b8f3d157efd5891eb5f0c0cbdfb3bb886229"
    sha256 cellar: :any_skip_relocation, sequoia:       "da6f8231e96c773e6dc687e02720ae7453e9a454093d843bdfedfbfb5f4f64dd"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "f206539f6a88e06b0863850ee36ac222eee1cd04e0bec7de750a48df35afde2c"
  end

  on_macos do
    on_arm do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.1.0/blindspot_darwin_arm64.tar.gz"
      sha256 "5851cca49e006fbe7f5998b1b703886687b155fc0fe8643368c97af4e837b0a4"
    end

    on_intel do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.1.0/blindspot_darwin_amd64.tar.gz"
      sha256 "d0be0ba139491671c9da4c4f5bf6796b2a50b3ac1d98d31f3e82d0e36349037e"
    end
  end

  on_linux do
    depends_on arch: :x86_64

    on_intel do
      url "https://github.com/kitanovicd/blindspot/releases/download/v0.1.0/blindspot_linux_amd64.tar.gz"
      sha256 "8d7ef2f401738cbd5dc24d454515ec2cbf7112fcf672edcb68e1115bde5412eb"
    end
  end

  def install
    bin.install "blindspot"
    doc.install "LICENSE", "GO_LICENSE", "THIRD_PARTY_NOTICES.md"
  end

  def caveats
    <<~EOS
      Requires Foundry (forge) on your PATH.

      Install Gambit once:
        blindspot setup

      From a Foundry project:
        blindspot run --limit 5 --open
    EOS
  end
end
