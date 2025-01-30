# 🪿 Desktop Goose Payload 🪿

![Uses the Cookiecutter Data Science project template, GOTem style](https://img.shields.io/badge/GOTem-Project%20Instance-328F97?logo=cookiecutter)

A mischievous Ducky Script that installs [Desktop Goose](https://samperson.itch.io/desktop-goose) onto unsuspecting colleagues' laptops, teaching them valuable lessons about computer security... one honk at a time >=\]

Currently for MacOS only.

> ⚠️ **Note**: This project is for educational and entertainment purposes only. Please use responsibly!

[![Desktop Goose](https://img.youtube.com/vi/EQx6fyrZDWM/0.jpg)](https://www.youtube.com/watch?v=EQx6fyrZDWM)

## 🛠️ Requirements

- A Rubber Ducky or similar keyboard-emulating device (like FlipperZero)
- Internet access
- Target machine must:
  - Run MacOS
  - Have Spotlight or some other search function enabled with CMD + Space
  - Be unlocked (obviously!)

## 🚀 How It Works

1. The Ducky Script (`./ducky-scripts/mac-desktop-goose.txt`) emulates keyboard inputs to:
   - Launch the terminal via Spotlight
   - Download and execute our payload script from this repo
1. The payload script (`payload.sh`):
   - Downloads Desktop Goose from `./data/desk-goose-mac.zip` to a new temporary directory.
   - Unzips and launches the goose
   - Chaos ensues! 🦢

## KILL HIM

Fine, do what you must

```bash
killall "Desktop Goose"
```

## 📱 FlipperZero Installation

### Method 1: qFlipper

1. Download and install [qFlipper](https://flipperzero.one/update) (or use [Flipper Lab](https://lab.flipper.net/archive))
1. Navigate to `SD Card/badusb` in qFlipper
1. Copy `./ducky-scripts/mac-desktop-goose.txt` to this location

## 🤝 Contributing

### Testing

Tests are written using the Bash Automated Testing System (BATS) and can be found in `./tests/test_payload.bats`. They don't currently work lol, will fix later. 🪿

### Auto-transfer Development

Working on automating the ducky script transfer process using the Flipper CLI or ufbt.

### Goose Customization

To add your own customizations, fork this repo (needed since the ducky script pulls from this repo). And change the references in `./payload.sh` and `./ducky-scripts/mac-desktop-goose.txt` to point to your repo.

Unzip the `./data/desk-goose-*.zip` files, make edits to the directories, then rezip.

**MacOS**

- More memes? Want to show your friends some funny hahas? Add them in `./data/desk-goose-*/Resources/Memes`
- More messages? Taunts perhaps? Add them in `./data/desk-goose-*/Resources/Notes`
- Other config? Edit them in `./data/desk-goose-*/Resources/...` I don't actually know...

**Windows**
[text](data/desk-goose-win/DesktopGoose%20v0.31/config.ini)

**Other Resources**

https://lim10dev.github.io/goose-customizer/

https://desktopgooseunofficial.github.io/ResourceHub/
