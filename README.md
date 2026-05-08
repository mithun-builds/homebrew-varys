# homebrew-varys

Homebrew tap for [Lord Varys](https://github.com/mithun-builds/varys) — an ambient AI memory tool for macOS.

## Install

```sh
brew install --cask mithun-builds/varys/varys
```

That command does three things at once:

1. Adds this tap (`brew tap mithun-builds/varys`).
2. Reads `Casks/varys.rb`.
3. Downloads + installs the latest **Lord Varys.app** to `/Applications/`.

## Update

```sh
brew upgrade --cask varys
```

## Uninstall

```sh
brew uninstall --cask varys
```

The Cask's `zap` stanza also removes app data and logs:

```sh
brew uninstall --cask --zap varys
```

## First-launch warning

Lord Varys ships with an ad-hoc signature for now (no Apple Developer ID).
On first launch, macOS Gatekeeper will warn _"Lord Varys.app cannot be
opened because the developer cannot be verified."_ Two options:

- **Right-click → Open → Open** (one-time bypass).
- Or in Terminal: `xattr -dr com.apple.quarantine "/Applications/Lord Varys.app"`.

A future release with a Developer ID signature will eliminate this prompt.

## Permissions

Lord Varys needs:

- **Microphone** — to record your voice.
- **Screen Recording** — required by macOS ScreenCaptureKit for capturing
  system / speaker audio.

Both are requested via standard macOS prompts the first time you click
**Start Recording**. Video frames are never captured or stored — only
audio is read from ScreenCaptureKit's stream.
