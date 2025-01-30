# Desktop-Goose-Payload

![Uses the Cookiecutter Data Science project template, GOTem style](https://img.shields.io/badge/GOTem-Project%20Instance-328F97?logo=cookiecutter)

This is a work-in-progress Ducky Script to install and launch [Desktop Goose](https://samperson.itch.io/desktop-goose) onto the laptops of unsuspecting colleagues to teach them the dangers of leaving their laptops exposed in their absence >=\]. Currently only for MacOS

This project is for purely educational and fun purposes.

[![Desktop Goose](https://img.youtube.com/vi/EQx6fyrZDWM/0.jpg)](https://www.youtube.com/watch?v=EQx6fyrZDWM)

### Requirements

- Rubber Ducky or another keyboard-emulating device
- Internet Access
- Spotlight or another searchbar linked to CMD + Space

### Process

The ducky script `./ducky-scripts/mac-desktop-goose.txt` emulates a keyboard to launch the terminal and downloads + runs a shell script from this GitHub Repo `payload.sh`. The shell script downloads Desktop Goose from `./data/desk-goose-mac.zip` to the `/tmp` directory, unzips it, and runs it.

### FlipperZero Install

Copy `./ducky-scripts/mac-desktop-goose.txt` onto your FlipperZero's SD card by downloading qFlipper, going to `SD Card/badusb`, and copying the text file over.

Or even better use [Flipper Lab](https://lab.flipper.net/archive).

Then run the ducky script as you would any other.

### Contributing

**Tests**
Tests are made with Bash Automated Testing System (BATS) can be found in `./tests/test_payload.bats`.

**Auto-transfer**
https://docs.flipper.net/development/cli

Use screen to enter the flipper CLI. I can't figure out where to go from here tbh. `storage list /ext/badusb` but I don't know how to do a tranfer from my own computer.

`brew install ufbt` might do something but idk. Need to look into later.

### Thanks

Thanks to samperson who made [Desktop Goose](https://samperson.itch.io/desktop-goose)
