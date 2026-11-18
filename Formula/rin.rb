class Rin < Formula
  desc "Deploy and manage your team of AI agents"
  homepage "https://github.com/w3lt/rin"
  url "https://github.com/w3lt/rin/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "e77fbc22580f6a611f2ed22c7dc85af8b9b266bffc54e90bdc4f1b2214575264"
  license "MIT OR Apache-2.0"

  depends_on "rust" => :build

  deny_network_access!

  def fetch
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match(/usage:/i, shell_output("#{bin}/rin --help"))
  end
end
