#! /bin/bash

API_URL="https://api.github.com/repos/dundee/gdu/releases/latest"
DOWNLOAD_URL=$(curl -s $API_URL | jq -r '.assets[] | select(.browser_download_url | test("\\.x86_64\\.rpm$")) | .browser_download_url')
FILE_NAME="gdu_x86_64.rpm"
OUTPUT_FILE="/tmp/$FILE_NAME"

echo "Installing GDU..."

echo "Removing old files if exists..."
rm -rf $OUTPUT_FILE

echo "Downloading..."
wget -c $DOWNLOAD_URL -O $OUTPUT_FILE

echo "Installing..."
sudo dnf install -y $OUTPUT_FILE

echo "GDU installed..."
