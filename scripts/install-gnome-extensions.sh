#! /bin/bash

PWD=$(pwd)
EXTENSIONS=$(sed "s/[^0-9]//g" "${PWD}/gnome-extensions")
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

_install_pano_extension() {
  NVM_PATH="$HOME/.nvm/nvm.sh"
  PANO_GIT_URL=https://github.com/oae/gnome-shell-pano.git
  PANO_TMP_DIR=/tmp/pano
  EXTENSION_DIR=$HOME/.local/share/gnome-shell/extensions
  EXTENSION_TARGET="$EXTENSION_DIR/pano@elhan.io"

  if [ ! -f "$NVM_PATH" ]; then
    echo "NVM not found. Please install NVM and Node."
    exit 0
  fi

  source "$NVM_PATH"

  echo "Installing Pano extension..."
  echo "Removing old files if exists..."
  rm -rf "$PANO_TMP_DIR" "$EXTENSION_TARGET"

  echo "Cloning Pano..."
  git clone --depth=1 "$PANO_GIT_URL" "$PANO_TMP_DIR"

  echo "Installing..."
  mkdir -p "$EXTENSION_DIR"
  cd "$PANO_TMP_DIR" && yarn install && yarn build
  mv "$PANO_TMP_DIR/dist" "$EXTENSION_TARGET"
}

echo "Installing gnome extensions..."
_install_gnome_shell_extension_intaller
_install_gnome_extensions
_install_pano_extension
echo "GNOME extensions installed."