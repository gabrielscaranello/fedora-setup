#! /bin/bash

GIT_URL="https://github.com/neovim/neovim"
BRANCH="stable"
WORK_DIR="/tmp/neovim"

echo "Installing Neovim..."

echo "Removing old files if exists..."
rm -rf $WORK_DIR

echo "Cloning Neovim..."
git clone --depth 1 -b "$BRANCH" "$GIT_URL" "$WORK_DIR"

# Install
echo "Installing..."
cd "$WORK_DIR" || exit
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

echo "Neovim installed..."
