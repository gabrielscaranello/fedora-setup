#! /bin/bash

PWD=$(pwd)
EXTENSIONS=$(sed "s/[^0-9]//g" "$PWD"/gnome-extensions)
SCRIPT_NAME="gnome-shell-extension-installer"
DOWNLOAD_URL="https://github.com/brunelli/gnome-shell-extension-installer/raw/master/$SCRIPT_NAME"
TARGET_DIR="$HOME/.local/bin"
TOOL_FILE="$TARGET_DIR/$SCRIPT_NAME"

_install_gnome_shell_extension_intaller() {
  mkdir -p "$TARGET_DIR"

  if [ ! -f "$TOOL_FILE" ]; then
    echo "Installing GNOME shell extension installer..."
    wget -c $DOWNLOAD_URL -O "$TOOL_FILE"
    chmod +x "$TOOL_FILE"
    echo "GNOME shell extension installer installed."
  fi
}

_install_gnome_extensions() {
  echo "Installing extensions..."

  for extension in $EXTENSIONS; do
    $TOOL_FILE --yes "$extension"
  done
}

echo "Installing gnome extensions..."
_install_gnome_shell_extension_intaller
_install_gnome_extensions
echo "GNOME extensions installed."
