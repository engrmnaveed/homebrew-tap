cask "space16x" do
  version "0.7.0"
  sha256 "44b2b84b1820f694ba821f08e98f36a2532809afb3781ce45e85aa209fa983fa"

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
