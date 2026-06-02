<p align="center">
	<img width="200" height="200" margin-right="100%" src="https://raw.githubusercontent.com/Mortennn/Dozer/master/Stuff/AppIcon.png">
</p>
<p align="center">Hide menu bar icons to give your Mac a cleaner look.</p>
<p align="center">
	<a href="https://github.com/xgitqa/Dozer/releases/latest">
 		<img src="https://img.shields.io/badge/download-latest-brightgreen.svg" alt="download">
	<a href="https://img.shields.io/badge/platform-macOS-lightgrey.svg">
 		<img src="https://img.shields.io/badge/platform-macOS-lightgrey.svg" alt="platform">
	</a>
	<a href="https://img.shields.io/badge/requirements-macOS%2012+-ff69b4.svg">
 		<img src="https://img.shields.io/badge/requirements-macOS%2012+-lightgrey.svg" alt="systemrequirements">
	</a>
	<a href="https://opensource.org/licenses/MPL-2.0">
 		<img src="https://img.shields.io/badge/License-MPL%202.0-orange.svg" alt="license">
	</a>
</p>
<p align="center">
	<img height="100" min-width="100" src="https://github.com/Mortennn/Dozer/raw/master/Stuff/demo.gif" alt="demo">
</p>

> **This is an unofficial fork** of [Mortennn/Dozer](https://github.com/Mortennn/Dozer) maintained to keep the app working on Apple Silicon Macs. The original project is unmaintained and its x86-only binaries require Rosetta 2, [which Apple is removing](https://support.apple.com/en-us/102527).

## What's different in this fork

- **Universal binary** — runs natively on Apple Silicon (arm64) and Intel (x86_64)
- **No Rosetta required** — works on macOS without Rosetta 2 installed
- Upgraded Sparkle 1.x → **Sparkle 2.x** for auto-update
- Replaced unmaintained MASShortcut → **KeyboardShortcuts**
- Requires **macOS 12 Monterey or later** (up from 10.13)

## ⚙️ Install

[Download the latest release](https://github.com/xgitqa/Dozer/releases/latest), unzip, and drag `Dozer.app` to your Applications folder.

> **First-launch note:** Releases are unsigned (no Apple Developer certificate). On first launch, right-click the app and choose **Open**, or run:
> ```sh
> xattr -cr /Applications/Dozer.app
> ```

## ⚫️ Dozer Icons

There are 2 or 3, numbered from right to left:

1. this can be positioned anywhere you prefer, it is only a point of interaction
2. this and everything to its left will be hidden/shown by clicking any Dozer icon
3. (Optional) the "remove" icon and everything to its left will be hidden/shown by option-clicking any Dozer icon

## 👨‍💻 Usage

* Move the icons you want to hide until clicked to the left of the second Dozer icon
* Move the icons you want to hide until option-clicked to the left of the third Dozer icon

**N.B. hold command (`⌘`) then drag to move the menu bar icons.**

## 👇 Interactions
* Left-click one of the Dozer icons to hide/show the first group of menu bar icons
* Option-Left-click one of the Dozer icons to show the second group of menu bar icons (optional)
* Right-click one of the Dozer icons to open the settings

## 🔨 Build from source

```sh
git clone https://github.com/xgitqa/Dozer
cd Dozer
make build
```

Requires Xcode 15+, Homebrew, and the tools listed in `Brewfile`.

## 📄 Requirements
macOS 12 Monterey or later
