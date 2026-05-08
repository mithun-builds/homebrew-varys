cask "varys" do
  version "0.1.0"
  sha256 "3ff51efdcc0fdb834953a5fe82c910caf9a09f2621669f59823a3ebea02c8f90"

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
    capture audio. macOS will prompt for both the first time you click
    Start Recording.

    Recordings are saved to ~/Documents/Lord Varys (configurable in
    Settings). Local Whisper transcription auto-runs after each Stop.
  EOS
end
