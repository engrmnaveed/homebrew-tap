# 16X Brains Homebrew tap

Homebrew casks for [Space 16X](https://github.com/engrmnaveed/diskspace-16x), a read-only disk space analyzer for macOS.

## Install Space 16X

```sh
brew tap engrmnaveed/tap
brew trust engrmnaveed/tap
brew install --cask engrmnaveed/tap/space16x
```

Homebrew 6 and later load casks only from taps you trust, so run `brew trust` once.

The app is free and open source. It is ad hoc signed and not notarized by Apple, so macOS blocks the first launch. To allow it, open **System Settings → Privacy & Security** and click **Open Anyway** next to the Space 16X message.

Upgrade with `brew upgrade --cask space16x`. Remove the app with `brew uninstall --cask space16x`, and add `--zap` to also remove its preferences.

## Maintenance

The [release workflow](https://github.com/engrmnaveed/diskspace-16x/blob/main/.github/workflows/publish-cli.yml) renders `Casks/space16x.rb` for each version tag and commits it here. See the [release runbook](https://github.com/engrmnaveed/diskspace-16x/blob/main/docs/release.md#homebrew-tap).
