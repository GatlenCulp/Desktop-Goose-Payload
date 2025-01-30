#!/usr/bin/env bats

setup() {
    # Create temp test directory and set as INSTALL_DIR
    export INSTALL_DIR="$(mktemp -d)"
    
    # Mock open command to prevent actual app launch
    function open() {
        echo "Mocked open called with: $@"
        return 0
    }
    export -f open
}

teardown() {
    # Clean up temp directory
    rm -rf "$INSTALL_DIR"
}

@test "E2E: Desktop Goose installs successfully" {
    # Run the install script
    run bash "desktop_goose_payload/install.sh"
    
    # Check exit status
    [ "$status" -eq 0 ]
    
    # Verify expected output messages
    [[ "${lines[0]}" == "Downloading Desktop Goose..." ]]
    [[ "${lines[-1]}" == "Installation complete!" ]]
    
    # Verify app exists and is executable
    [ -x "$INSTALL_DIR/Desktop Goose.app/Contents/MacOS/Desktop Goose" ]
}