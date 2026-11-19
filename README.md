# 16X Brains Homebrew tap

Homebrew casks for [Space 16X](https://github.com/engrmnaveed/diskspace-16x), a read-only disk space analyzer for macOS.

## Install Space 16X

```sh
brew tap engrmnaveed/tap
brew trust engrmnaveed/tap
brew install --cask engrmnaveed/tap/space16x
```

Homebrew 6 and later load casks only from taps you trust, so run `brew trust` once.

## First launch

The app is free and open source. It is ad hoc signed and not notarized by Apple, so macOS blocks the first launch. You approve it once:

1. Open Space 16X. When macOS says it can't verify the app, click **Done**. Don't click **Move to Trash**, which deletes the app.
2. Open **System Settings → Privacy & Security**.
3. Scroll to **Security**. Below **Allow applications from**, click **Open Anyway** next to the message about Space 16X.
4. Enter your password or use Touch ID, then click **Open Anyway** again.

**Open Anyway** appears only after you try to open the app, and for about an hour after that. If it's missing, open the app again and return. If the app went to the Trash, run `brew reinstall --cask space16x`. The [installation guide](https://github.com/engrmnaveed/diskspace-16x/blob/main/docs/install.md#allow-the-first-launch) has more detail.

## Upgrade and remove

Upgrade with `brew upgrade --cask space16x`. Remove the app with `brew uninstall --cask space16x`, and add `--zap` to also remove its preferences.

## Maintenance

The [release workflow](https://github.com/engrmnaveed/diskspace-16x/blob/main/.github/workflows/publish-cli.yml) renders `Casks/space16x.rb` for each version tag and commits it here. See the [release runbook](https://github.com/engrmnaveed/diskspace-16x/blob/main/docs/release.md#homebrew-tap).
