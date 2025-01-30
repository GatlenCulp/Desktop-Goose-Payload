#!/usr/bin/env bats

setup() {
    # Load the script - adjust path as needed
    INSTALL_SCRIPT="desktop_goose_payload/install.sh"
    
    # Create temp test directory
    export INSTALL_DIR="$(mktemp -d)"
    
    # Mock external commands
    function curl() {
        echo "Mocked curl called with: $@" >&2
        # Create a test zip file
        zip "${INSTALL_DIR}/desktop-goose.zip" -r "${BATS_TEST_DIRNAME}/fixtures/test_app" >/dev/null
        return 0
    }
    export -f curl

    function open() {
        echo "Mocked open called with: $@" >&2
        return 0
    }
    export -f open
}

teardown() {
    # Clean up temp directory
    rm -rf "$INSTALL_DIR"
}

@test "install script downloads and extracts successfully" {
    # Run the install script
    run bash "$INSTALL_SCRIPT"
    
    # Check exit status
    [ "$status" -eq 0 ]
    
    # Verify expected output messages
    [[ "${lines[0]}" == "Downloading Desktop Goose..." ]]
}

@test "handles curl download failure" {
    # Override curl mock to simulate failure
    function curl() {
        return 1
    }
    export -f curl
    
    # Run the install script
    run bash "$INSTALL_SCRIPT"
    
    # Check that script failed
    [ "$status" -eq 1 ]
    
    # Verify error message
    [[ "${lines[1]}" == "Error: Failed to download the file" ]]
}

@test "handles invalid zip file" {
    # Override curl mock to create invalid zip
    function curl() {
        echo "invalid data" > "${INSTALL_DIR}/desktop-goose.zip"
        return 0
    }
    export -f curl
    
    # Run the install script
    run bash "$INSTALL_SCRIPT"
    
    # Check that script failed
    [ "$status" -eq 1 ]
    
    # Verify error message
    [[ "${lines[1]}" == "Error: Downloaded file is not a valid ZIP archive" ]]
}

@test "creates executable app" {
    run bash "$INSTALL_SCRIPT"
    
    [ "$status" -eq 0 ]
    
    # Check that app directory exists and has correct permissions
    [ -x "${INSTALL_DIR}/Desktop Goose.app/Contents/MacOS/Desktop Goose" ]
}