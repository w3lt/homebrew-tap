class Rin < Formula
  desc "Deploy and manage your team of AI agents"
  homepage "https://github.com/w3lt/rin"
  url "https://github.com/w3lt/rin/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e77fbc22580f6a611f2ed22c7dc85af8b9b266bffc54e90bdc4f1b2214575264"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/w3lt/rin/releases/download/v#{version}/rin-aarch64-apple-darwin.tar.gz"
    sha256 "c4d8224b39e4f813a37f0c7a5afa5d6492dd6e086621d08e74e327d2eaca5702"
  end

  on_linux do
    on_arm do
      url "https://github.com/w3lt/rin/releases/download/v#{version}/rin-aarch64-unknown-linux-musl.tar.gz"
      sha256 "75279b51f11eace3799c4bba5d850d6124c5d86521d411525c1a7c72f0ed085d"
    end

    on_intel do
      url "https://github.com/w3lt/rin/releases/download/v#{version}/rin-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5af3c48bd8dbddd34460cc6223e771bfe8d66df2805cfd2341578567a0e757eb"
    end
  end

  deny_network_access!

  def.install
    bin.install "rin"
  end

  test do
    assert_match "rin #{version}", shell_output("#{bin}/rin --version")
    generate_completions_from_executable(bin/"rin", "completions")
  end
end
