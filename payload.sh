#!/bin/bash

# To run this, use:
# curl -sSL https://raw.githubusercontent.com/GatlenCulp/Desktop-Goose-Payload/main/desktop_goose_payload/install.sh | bash

set -e  # Exit on error

export INSTALL_DIR="$(mktemp -d)"
export MACOS_DOWNLOAD="https://raw.githubusercontent.com/GatlenCulp/Desktop-Goose-Payload/main/data/Desktop%20Goose%20for%20Mac%20v0.22.zip"
export ZIP_PATH="$INSTALL_DIR/desktop-goose.zip"

# Download the zip file with error checking
echo "Downloading Desktop Goose..."
if ! curl -L -f "$MACOS_DOWNLOAD" -o "$ZIP_PATH"; then
    echo "Error: Failed to download the file"
    echo "URL attempted: $MACOS_DOWNLOAD"
    exit 1
fi

# Verify the file exists and has content
if [ ! -s "$ZIP_PATH" ]; then
    echo "Error: Downloaded file is empty"
    exit 1
fi

# Check if it's a valid zip file
if ! file "$ZIP_PATH" | grep -i "zip archive" > /dev/null; then
    echo "Error: Downloaded file is not a valid ZIP archive"
    echo "File type: $(file "$ZIP_PATH")"
    exit 1
fi

# Unzip to install directory
echo "Extracting files..."
unzip -o "$ZIP_PATH" -d "$INSTALL_DIR"

# Make executable and launch
echo "Launching Desktop Goose..."
chmod +x "$INSTALL_DIR/Desktop Goose.app/Contents/MacOS/Desktop Goose"
open "$INSTALL_DIR/Desktop Goose.app"

# Clean up zip file
rm "$ZIP_PATH"

echo "Installation complete!"