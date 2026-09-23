class NudgeAgent < Formula
  desc "Phone notifications for OpenCode and Codex — manage a Nudge install"
  homepage "https://github.com/tomfc23/nudge"
  url "https://github.com/tomfc23/nudge/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ed6d87445a1b55cd861d6359da99cfac20e64c619adc7357887ec83f1302c03e"
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
