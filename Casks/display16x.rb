cask "display16x" do
  version "0.5.2"
  sha256 "a600d43a4560d965d4aff1b004b837a622e2e27b61ab69febcb51d206674810a"

  url "https://github.com/engrmnaveed/macdisplay-16x/releases/download/v#{version}/display16x-#{version}-macos-arm64.zip"
  name "Display 16X"
  desc "Menu bar controls for display resolution, brightness and volume"
  homepage "https://github.com/engrmnaveed/macdisplay-16x"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Display 16X.app"
  binary "#{appdir}/Display 16X.app/Contents/MacOS/display16x"

  uninstall quit: "com.16xbrains.macdisplay16x"

  zap trash: "~/Library/Application Support/com.16xbrains.macdisplay16x"

  caveats <<~EOS
    Display 16X is ad hoc signed and not notarized by Apple, so macOS blocks
    the first launch. To allow it:
      1. Open Display 16X and click Done in the warning.
         Don't click Move to Trash, which deletes the app.
      2. Open System Settings > Privacy & Security.
      3. Under Security, click Open Anyway next to the Display 16X message.
      4. Enter your password or use Touch ID, then click Open Anyway.

    Open Anyway appears only after a launch attempt, for about an hour.
    Or remove the quarantine attribute yourself:
      xattr -dr com.apple.quarantine "#{appdir}/Display 16X.app"

    An ad hoc signature changes with every build, so macOS treats each
    update as a new app. After an update, allow the first launch again, and
    for the brightness and volume keys remove the old Display 16X entry in
    System Settings > Privacy & Security > Accessibility and add the new one.
  EOS
end
