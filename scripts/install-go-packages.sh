#! /bin/bash

PACKAGES=$(tr '\n' ' ' <"$PWD/go-packages")

echo "Installing packages..."
echo "$PACKAGES" | xargs go install

echo "Go packages installation done"
