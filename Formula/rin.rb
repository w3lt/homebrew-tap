class Rin < Formula
  desc "Deploy and manage your team of AI agents"
  homepage "https://github.com/w3lt/rin"
  version "0.2.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/w3lt/rin/releases/download/v0.2.0/rin-aarch64-apple-darwin.tar.gz"
      sha256 "78603682d01f28a8a8c1e86dbb02a37daf53e64f36773186df792bb08c545870"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/w3lt/rin/releases/download/v0.2.0/rin-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8f47021798349e9dc3c949b4c794da3fd1d3c06bda4e0cbe12054e1547773bef"
    end

    on_arm do
      url "https://github.com/w3lt/rin/releases/download/v0.2.0/rin-aarch64-unknown-linux-musl.tar.gz"
      sha256 "419f72b2d905ceee0c87dde341122314d8bc5b8a1c500a6d4352d6b9b6f15e75"
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
