class NudgeAgent < Formula
  desc "Phone notifications for OpenCode and Codex — manage a Nudge install"
  homepage "https://github.com/tomfc23/nudge"
  url "https://github.com/tomfc23/nudge/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "1400959f80857e4f820949eca1964f9b4df992ddaf713a84837e165b9b5b6730"
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
