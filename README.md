# Desktop-Goose-Payload

![Uses the Cookiecutter Data Science project template, GOTem style](https://img.shields.io/badge/GOTem-Project%20Instance-328F97?logo=cookiecutter)

This is a work-in-progress Ducky Script to install and launch [Desktop Goose](https://samperson.itch.io/desktop-goose) onto the laptops of unsuspecting colleagues to teach them the dangers of leaving their laptops exposed in their absence >=\]

This project is for purely educational and fun purposes.

[![Desktop Goose](https://img.youtube.com/vi/EQx6fyrZDWM/0.jpg)](https://www.youtube.com/watch?v=EQx6fyrZDWM)

### Process

The ducky script `./desktop_goose_payload/mac-desktop-goose.txt` emulates a keyboard to launch the terminal and downloads + runs a shell script from this GitHub Repo `./desktop_goose_payload/install.sh`. The shell script downloads Desktop Goose to the `/tmp` directory and runs it.

### FlipperZero Install

Copy `/desktop_goose_payload/mac-desktop-goose.txt` onto your FlipperZero's SD card by downloading qFlipper, going to `SD Card/badusb`, and copying the text file over.

Then run the ducky script as you would any other.
