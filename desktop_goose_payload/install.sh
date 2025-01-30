#!/bin/bash

export PROJ_ROOT="/Users/gat/work/desktop-goose-payload"
export INSTALL_DIR="/tmp"
# export INSTALL_DIR="/tmp/"

# Install
cp -R "$PROJ_ROOT/data/desk-goose-mac/Desktop Goose.app" $INSTALL_DIR
chmod +x "$INSTALL_DIR/Desktop Goose.app/Contents/MacOS/Desktop Goose"
open "$INSTALL_DIR/Desktop Goose.app"