#! /bin/bash

PWD=$(pwd)

echo "Setup default apps..."

echo "Copying mimeapps.list..."
cp "$PWD"/config/mimeapps.list ~/.config/mimeapps.list

echo "Default apps setup done."
