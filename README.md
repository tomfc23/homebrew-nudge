# Homebrew tap for Nudge — retired

This tap is retired. The `nudge-agent` CLI it packaged has been removed from Nudge;
there is no replacement Homebrew package.

```bash
brew uninstall nudge-agent   # if you installed it
brew untap tomfc23/nudge     # remove the tap
```

Install Nudge without a CLI instead:

```bash
curl -fsSL https://nudge.tommyek.com/install.sh -o install.sh && sh install.sh
```

or hand the agent runbook to your coding agent:
<https://raw.githubusercontent.com/tomfc23/nudge/main/INSTALL.md>.

See the [Nudge README](https://github.com/tomfc23/nudge) for current instructions.
