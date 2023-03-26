---
extends: _layouts.post
title: From PC (Linux/Windows) to macOS
author: Cristian Radulescu
date: 2022-11-20
section: content
---

#### To do list
- Learn [MacOS keyboard shortcuts](https://support.apple.com/en-us/HT201236); write them down and search when necessary;
- Use [Homebrew](https://brew.sh) to install applications;
- Prevent the ALT key to generate special chars when used in combination with another key - change keyboard input source to _Unicode hex input_;
- Speed up cursor movement while kepping an arrow key pressed - in Keyboard settings change _Delay until repeat_ + _Key repeat_.

#### Apps
- [Rectangle](https://formulae.brew.sh/cask/rectangle#default) - move and resize windows using keyboard shortcuts or snap areas;
- [Flameshot](https://formulae.brew.sh/cask/flameshot#default) - better screenshot tool;
- [1clipboard](https://formulae.brew.sh/cask/1clipboard#default) or [copyq](https://formulae.brew.sh/cask/copyq#default) - clipoard manager;
- [alt-tab](https://formulae.brew.sh/cask/alt-tab#default) - enable Windows-like alt-tab.


#### Remove quarantine attribute
When you get an error that will prevent you from opening an unsigned app (like _"CopyQ.app" cannot be opened because the developer cannot be verified_. macOS cannot verify that this app is free from malware.) you need to run from command line:
```shell
sudo spctl --master-disable && sudo xattr -rd com.apple.quarantine /Applications/CopyQ.app && sudo spctl --master-enable
```
Replace _/Applications/CopyQ.app_ with the app that is reported in the error message.

Bash script which automates the above command: [https://gist.github.com/cristianradulescu/5bb29875c8c771e12710e00824c01e74](https://gist.github.com/cristianradulescu/5bb29875c8c771e12710e00824c01e74).

Other things to try - [Bill Mill's awesome setup script](https://gist.github.com/llimllib/c4dd0a98a426022b0365d4c0a9090460).
