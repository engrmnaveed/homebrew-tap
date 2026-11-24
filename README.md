# 16X Brains Homebrew tap

Homebrew packages for [DiskUse16x](https://github.com/engrmnaveed/diskuse16x), a free, read-only disk space analyzer: a native Mac app and a terminal explorer for macOS and Linux. It was called Space 16X before 1.0.

Add the tap and trust it once. Homebrew 6 and later load casks and formulas only from taps you trust.

```sh
brew tap engrmnaveed/tap
brew trust engrmnaveed/tap
```

## The Mac app

```sh
brew install --cask engrmnaveed/tap/diskuse16x
```

The app is free and open source. It is ad hoc signed and not notarized by Apple, so macOS blocks its first launch until you allow it once:

1. Open DiskUse16x. When macOS says it can't verify the app, click **Done**. Don't click **Move to Trash**, which deletes the app.
2. Open **System Settings → Privacy & Security**.
3. Scroll to **Security**. Below **Allow applications from**, click **Open Anyway** next to the message about DiskUse16x.
4. Enter your password or use Touch ID, then click **Open Anyway** again.

**Open Anyway** appears only after you try to open the app, and for about an hour after that. If it's missing, open the app again and return. To skip this step entirely, install with [one command](https://github.com/engrmnaveed/diskuse16x/blob/main/docs/install.md#install-with-one-command) instead.

Upgrade with `brew upgrade --cask diskuse16x`. Remove the app with `brew uninstall --cask diskuse16x`, and add `--zap` to also remove its preferences.

## The command-line tool

```sh
brew install engrmnaveed/tap/du16x
```

`du16x` installs the Basic edition of the CLI, and `du16x-pro` installs Pro, on macOS and Linux. Both install the commands `diskuse16x` and `du16x`, so Homebrew keeps one edition at a time: uninstall one before installing the other. Upgrade with `brew upgrade du16x` and remove it with `brew uninstall du16x`, with `du16x-pro` for Pro.

## Coming from Space 16X

The `space16x` cask is now `diskuse16x`. `brew update` and `brew upgrade` move you over, and the app keeps your settings and saved scans. macOS sees a new app, so turn on Full Disk Access for **DiskUse16x** again if you use it. See [Upgrading from Space 16X](https://github.com/engrmnaveed/diskuse16x/blob/main/docs/install.md#upgrading-from-space-16x).

## Maintenance

The [release workflow](https://github.com/engrmnaveed/diskuse16x/blob/main/.github/workflows/publish-cli.yml) renders `Casks/diskuse16x.rb`, `Formula/du16x.rb` and `Formula/du16x-pro.rb` for each version tag and commits them here, and keeps `cask_renames.json` mapping `space16x` to `diskuse16x`. See the [release runbook](https://github.com/engrmnaveed/diskuse16x/blob/main/docs/release.md#homebrew-tap).
