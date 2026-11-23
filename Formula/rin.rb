class Rin < Formula
  desc "Deploy and manage your team of AI agents"
  homepage "https://github.com/w3lt/rin"
  version "0.1.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/w3lt/rin/releases/download/v0.1.2/rin-aarch64-apple-darwin.tar.gz"
      sha256 "9216e8c590502daf9e9c6c2899bd67f8cc6893c8ce86c495c8d9661e2ce16ba8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/w3lt/rin/releases/download/v0.1.2/rin-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b37fce49b727b8eb36ad6a57d9a04536cbc22121c8cdbb496fc4dee620f01142"
    end

    on_arm do
      url "https://github.com/w3lt/rin/releases/download/v0.1.2/rin-aarch64-unknown-linux-musl.tar.gz"
      sha256 "19f75bff0473da19821e4dea131b4a388f53041eb4de90ed9ec44360967e125d"
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
