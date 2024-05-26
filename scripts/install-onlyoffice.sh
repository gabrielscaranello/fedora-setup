#! /bin/bash

FILE_NAME="onlyoffice-desktopeditors.x86_64.rpm"
OUTPUT_FILE="/tmp/$FILE_NAME"
DOWNLOAD_URL="https://download.onlyoffice.com/install/desktop/editors/linux/$FILE_NAME"

echo "Installing OnlyOffice..."

echo "Removing old files if exists..."
rm -rf "$OUTPUT_FILE"

echo "Downloading..."
wget -c "$DOWNLOAD_URL" -O "$OUTPUT_FILE"

echo "Installing..."
sudo dnf install -y "$OUTPUT_FILE"

echo "OnlyOffice installed..."
