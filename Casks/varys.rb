cask "varys" do
  version "0.2.1"
  sha256 "928a87d77db164f18321d2971ee338cf73622a4765cb5233d7beb070b1b3929f"

  url "https://github.com/mithun-builds/varys/releases/download/v#{version}/Lord-Varys-#{version}-arm64.dmg"
  name "Lord Varys"
  desc "Ambient AI memory for work — silent meeting capture + local Whisper transcription"
  homepage "https://github.com/mithun-builds/varys"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura" # ScreenCaptureKit audio requires macOS 13.0+
  depends_on arch: :arm64

  app "Lord Varys.app"

  # `uninstall quit` makes brew terminate any running instance before
  # replacing the bundle, preventing the "DMG stays mounted, app still
  # running" upgrade footgun.
  uninstall quit:        "com.lordvarys.app",
            launchctl:   "com.lordvarys.app"

  zap trash: [
    "~/Library/Application Support/com.lordvarys.app",
    "~/Library/Caches/com.lordvarys.app",
    "~/Library/Logs/com.lordvarys.app",
    "~/Library/Preferences/com.lordvarys.app.plist",
    "~/Library/Saved Application State/com.lordvarys.app.savedState",
    "~/Library/WebKit/com.lordvarys.app",
  ]

  caveats <<~EOS
    Lord Varys is currently signed ad-hoc (no Apple Developer ID). On first
    launch, macOS will warn the developer cannot be verified. Either:

      • Right-click "Lord Varys.app" → Open → Open
      • Or run: xattr -dr com.apple.quarantine "/Applications/Lord Varys.app"

    Lord Varys requires Microphone and Screen Recording permissions to
    capture audio. The setup guide opens on first launch and walks you
    through both prompts plus the Whisper model download.

    Recordings are saved to ~/Documents/Lord Varys (configurable in
    Settings). Local Whisper transcription auto-runs after each Stop and
    writes a markdown .txt + structured .json beside each WAV.

    Before upgrading, brew now stops any running instance via the
    `uninstall quit` directive. If a manual cleanup is needed:

      pkill -f "Lord Varys|lord_varys|sckit_capture" || true
      hdiutil detach "/Volumes/Lord Varys 0.2.1" 2>/dev/null || true
  EOS
end
