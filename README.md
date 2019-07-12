# Arch Linux personal system configuration

My [dotfiles](https://github.com/neon64/dotfiles) have been gradually becoming too system-specific, including config files and utilities that really only make sense for a specific machine.

Thus this repo will remain seperate from my dotfiles, and deal with all nitty-gritty system configuration. This includes:

- locales, timezones, etc...
- wifi and bluetooth
- power saving tweaks
- driver selection
- bootloaders
- pacman config

At the moment, this is all managed through custom PKGBUILDs.

## Why share?

Its unlikely that any of these scripts / docs will work out of the box on different devices, however that said I hope there is still something to learn.

I also aim to contribute back to the Arch wiki with some things I've discovered only through experimentation.

## Inspiration

I took heavy inspiration from Arch packages like [this](https://github.com/Earnestly/pkgbuilds/tree/master/system-config).

## Devices

### Thinkpad X1 Extreme

- dual booting Windows and Arch

### Live USB

- an experiment to fit most of my system setup in a really small USB stick, with space left over for personal documents
- try at your own risk, I think I might have killed off my old 4GB usb