class Rin < Formula
  desc "Deploy and manage your team of AI agents"
  homepage "https://github.com/w3lt/rin"
  version "0.1.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/w3lt/rin/releases/download/v0.1.1/rin-aarch64-apple-darwin.tar.gz"
      sha256 "87cdd7de451cf3bd1d1be977f148bcc2fa17e2086275a02755ef4f1c575e09cb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/w3lt/rin/releases/download/v0.1.1/rin-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3c5cde46602c81ac15ed8a8ecaabe6ef27a09d5e8ae7aeb93274a2a3a07b28e7"
    end

    on_arm do
      url "https://github.com/w3lt/rin/releases/download/v0.1.1/rin-aarch64-unknown-linux-musl.tar.gz"
      sha256 "13cc567589873919cbbaaf1c43d2482fb452041b01d9c5eddb0c5938aa1f7f9d"
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
