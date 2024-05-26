#! /bin/bash

LAST_VERSION=$(curl -s https://api.github.com/repos/dundee/gdu/releases/latest | grep -Po '"tag_name": "v\K[^"]*')
FILE_NAME="gdu_${LAST_VERSION}.x86_64.rpm"
OUTPUT_FILE="/tmp/$FILE_NAME"
DOWNLOAD_URL="https://github.com/dundee/gdu/releases/download/v$LAST_VERSION/$FILE_NAME"

echo "Installing GDU..."

echo "Removing old files if exists..."
rm -rf $OUTPUT_FILE

echo "Downloading..."
wget -c $DOWNLOAD_URL -O $OUTPUT_FILE

echo "Installing..."
sudo dnf install -y $OUTPUT_FILE

echo "GDU installed..."
