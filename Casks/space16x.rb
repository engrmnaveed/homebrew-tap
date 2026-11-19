cask "space16x" do
  version "0.2.3"
  sha256 "f8e00be0cd72b318e4d138f004039d9f6f128129581bfdda3153d76a8d67eb47"

  url "https://github.com/engrmnaveed/diskspace-16x/releases/download/v#{version}/space16x-#{version}-macos-universal.zip"
  name "Space 16X"
  desc "Read-only disk space analyzer"
  homepage "https://github.com/engrmnaveed/diskspace-16x"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Space 16X.app"

  zap trash: [
    "~/Library/Preferences/com.16xbrains.space16x.plist",
    "~/Library/Saved Application State/com.16xbrains.space16x.savedState",
  ]

  caveats <<~EOS
    Space 16X is ad hoc signed and not notarized by Apple, so macOS blocks
    the first launch. To allow it once:
      1. Open Space 16X and click Done in the warning.
         Don't click Move to Trash, which deletes the app.
      2. Open System Settings > Privacy & Security.
      3. Under Security, click Open Anyway next to the Space 16X message.
      4. Enter your password or use Touch ID, then click Open Anyway.

    Open Anyway appears only after a launch attempt, for about an hour.

    Or remove the quarantine attribute yourself:
      xattr -dr com.apple.quarantine "#{appdir}/Space 16X.app"
  EOS
end
