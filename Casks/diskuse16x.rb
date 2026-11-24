cask "diskuse16x" do
  version "1.0.0"
  sha256 "d708986e32f9457ea51509bfc4ad29f6a626f0126dd3b000accaff0e67cdc56e"

  url "https://github.com/engrmnaveed/diskuse16x/releases/download/v#{version}/diskuse16x-#{version}-macos-universal.zip"
  name "DiskUse16x"
  desc "Read-only disk space analyzer"
  homepage "https://github.com/engrmnaveed/diskuse16x"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "DiskUse16x.app"

  zap trash: [
    "~/Library/Preferences/com.16xbrains.diskuse16x.plist",
    "~/Library/Preferences/com.16xbrains.space16x.plist",
    "~/Library/Saved Application State/com.16xbrains.diskuse16x.savedState",
    "~/Library/Saved Application State/com.16xbrains.space16x.savedState",
  ]

  caveats <<~EOS
    DiskUse16x is ad hoc signed and not notarized by Apple, so macOS blocks
    the first launch. To allow it once:
      1. Open DiskUse16x and click Done in the warning.
         Don't click Move to Trash, which deletes the app.
      2. Open System Settings > Privacy & Security.
      3. Under Security, click Open Anyway next to the DiskUse16x message.
      4. Enter your password or use Touch ID, then click Open Anyway.

    Open Anyway appears only after a launch attempt, for about an hour.

    Or remove the quarantine attribute yourself:
      xattr -dr com.apple.quarantine "#{appdir}/DiskUse16x.app"
  EOS
end
