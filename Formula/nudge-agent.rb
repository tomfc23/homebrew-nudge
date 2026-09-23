class NudgeAgent < Formula
  desc "Phone notifications for AI coding agents — manage a Nudge install"
  homepage "https://github.com/tomfc23/nudge"
  url "https://github.com/tomfc23/nudge/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "1e1ce84bb26b63267045e2886142697f37ebb201b96c5490c4feca679f48bdd6"
  license "MIT"
  head "https://github.com/tomfc23/nudge.git", branch: "main"

  depends_on "node"

  def install
    # package.json must travel with the script: the CLI reads it for --version,
    # and prints "nudge-agent unknown" without it.
    libexec.install "cli/nudge-agent.mjs", "cli/package.json"
    bin.install_symlink libexec/"nudge-agent.mjs" => "nudge-agent"
  end

  test do
    assert_match "nudge-agent #{version}", shell_output("#{bin}/nudge-agent --version")
    assert_match "manage a Nudge install", shell_output("#{bin}/nudge-agent --help")
  end
end
