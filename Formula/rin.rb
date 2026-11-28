class Rin < Formula
  desc "Deploy and manage your team of AI agents"
  homepage "https://github.com/w3lt/rin"
  version "0.2.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/w3lt/rin/releases/download/v0.2.1/rin-aarch64-apple-darwin.tar.gz"
      sha256 "a530e3e2293eeb410d166513dda511bc7a6154da51e643ab41ebd5bb3ec1823b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/w3lt/rin/releases/download/v0.2.1/rin-x86_64-unknown-linux-musl.tar.gz"
      sha256 "79e3cffc627b182b892e28923aaef2b54b6b0ec18bf2045d6fe3781df6b2a3b0"
    end

    on_arm do
      url "https://github.com/w3lt/rin/releases/download/v0.2.1/rin-aarch64-unknown-linux-musl.tar.gz"
      sha256 "158ebb82b00a53b0a8f36add737a10807c0fd72c776a200362bec52534f64063"
    end
  end

  deny_network_access!

  def install
    bin.install "rin"
    generate_completions_from_executable(bin/"rin", "completions")
  end

  test do
    assert_match(/usage:/i, shell_output("#{bin}/rin --help"))
  end
end
