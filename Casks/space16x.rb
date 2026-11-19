cask "space16x" do
  version "0.2.2"
  sha256 "1c18f5ee160d463030f733e59c9ec07f76c251cae8f8f8f64836ed6ec0718b38"

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
      1. Open Space 16X, then dismiss the warning.
      2. Open System Settings > Privacy & Security.
      3. Click Open Anyway next to the Space 16X message and confirm.

    Or remove the quarantine attribute yourself:
      xattr -dr com.apple.quarantine "#{appdir}/Space 16X.app"
  EOS
end
