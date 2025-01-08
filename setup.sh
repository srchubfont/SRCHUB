#!/bin/bash

# Clone SRC_HUB repository
REPO_URL="https://github.com/srchubfont/SRCHUB.git"
TARGET_DIR="$HOME/SRC_HUB"

# Directory of the executable
EXECUTABLE="$TARGET_DIR/SRC_HUB"

# Target link location
LINK_PATH="/data/data/com.termux/files/usr/bin/SRC_HUB"

# Check if the repository already exists
if [ -d "$TARGET_DIR" ]; then
    echo "The directory $TARGET_DIR already exists. Skipping cloning."
else
    echo "Cloning the repository..."
    git clone "$REPO_URL" "$TARGET_DIR" || { echo "Failed to clone repository."; exit 1; }
fi

# Check if the obfuscated executable exists
if [ ! -f "$EXECUTABLE" ]; then
    echo "Error: Executable not found in $EXECUTABLE. NOW FOLLOW NEXT COMMAND."
    exit 1
fi

# Create a symbolic link
ln -sf "$EXECUTABLE" "$LINK_PATH"

# Ensure the script is executable
chmod +x "$EXECUTABLE"

echo "Setup complete! You can now run the script from anywhere by typing 'SRC_HUB'."