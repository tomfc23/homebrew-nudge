class NudgeAgent < Formula
  desc "Phone notifications for AI coding agents — manage a Nudge install"
  homepage "https://github.com/tomfc23/nudge"
  url "https://github.com/tomfc23/nudge/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "82744061d2a0bac4351316ec2ab325abe228aa4ceb382f01e4d87f6c0cebb3b9"
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
