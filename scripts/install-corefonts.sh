#! /bin/bash

FILE_NAME="msttcore-fonts-installer-2.6-1.noarch.rpm"
OUTPUT_FILE="/tmp/$FILE_NAME"
DOWNLOAD_URL="https://downloads.sourceforge.net/project/mscorefonts2/rpms/$FILE_NAME"

echo "Installing Corefonts..."

echo "Removing old files if exists..."
rm -rf "$OUTPUT_FILE"

echo "Downloading..."
wget -c "$DOWNLOAD_URL" -O "$OUTPUT_FILE"

echo "Installing..."
sudo dnf install -y "$OUTPUT_FILE"

echo "Corefonts installed..."
