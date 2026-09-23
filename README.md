# Homebrew tap for Nudge

```bash
brew tap tomfc23/nudge
brew install nudge-agent
```

`nudge-agent` manages a [Nudge](https://github.com/tomfc23/nudge) install — phone
notifications from OpenCode and Codex via a self-hosted ntfy server.

```bash
nudge-agent install    # run the setup wizard
nudge-agent status     # what is wired up right now
nudge-agent update     # bring the plugin up to date
```

The formula installs the CLI script straight from the release tarball and needs only
`node` — nothing is compiled. The plugin and server themselves are set up by the
installer, which the CLI downloads and runs.

Release steps for this tap (bumping `url` and `sha256`) live in
[RELEASING.md](https://github.com/tomfc23/nudge/blob/main/RELEASING.md).
