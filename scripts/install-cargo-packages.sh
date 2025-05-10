#! /bin/bash

PWD=$(pwd)
PACKAGES=$(tr '\n' ' ' <"${PWD}/cargo-packages")

echo "Installing cargo packages..."
echo "$PACKAGES" | xargs cargo install
echo "Cargo packages installed."
