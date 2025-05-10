#! /bin/bash

LAST_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -Po '"tag_name": "v\K[^"]*')
FILE_NAME="lazygit_${LAST_VERSION}_Linux_x86_64.tar.gz"
OUTPUT_FILE="/tmp/$FILE_NAME"
DOWNLOAD_URL="https://github.com/jesseduffield/lazygit/releases/download/v$LAST_VERSION/$FILE_NAME"
EXTRACT_DIR="/tmp/lazygit"
TARGET_DIR="/usr/local/bin"

echo "Installing Lazygit..."

echo "Removing old files if exists..."
rm -rf "$OUTPUT_FILE" $EXTRACT_DIR

echo "Downloading..."
wget -c "$DOWNLOAD_URL" -O "$OUTPUT_FILE"

echo "Installing..."
mkdir -p $EXTRACT_DIR
tar xf "$OUTPUT_FILE" -C /tmp
sudo install $EXTRACT_DIR $TARGET_DIR

echo "Lazygit installed..."
