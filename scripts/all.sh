#! /bin/bash

set -e

PWD=$(pwd)

echo "Installing all setup..."

bash "${PWD}/scripts/remove-unused-repos.sh"
bash "${PWD}/scripts/remove-unused-packages.sh"
bash "${PWD}/scripts/add-missing-repos.sh"
bash "${PWD}/scripts/install-system-packages.sh"
bash "${PWD}/scripts/install-multimedia-codecs.sh"
bash "${PWD}/scripts/install-flatpak-packages.sh"
bash "${PWD}/scripts/install-cargo-packages.sh"
bash "${PWD}/scripts/install-nvm.sh"

bash "${PWD}/scripts/install-corefonts.sh"
bash "${PWD}/scripts/install-gitflow-cjs.sh"
bash "${PWD}/scripts/install-gnome-extensions.sh"
bash "${PWD}/scripts/install-go.sh"
bash "${PWD}/scripts/install-jetbrains-mono.sh"
bash "${PWD}/scripts/install-lazydocker.sh"
bash "${PWD}/scripts/install-lazygit.sh"

bash "${PWD}/scripts/copy-desktop-config.sh"
bash "${PWD}/scripts/copy-timeshift-config.sh"
bash "${PWD}/scripts/hide-desktop-apps.sh"
bash "${PWD}/scripts/setup-look.sh"
bash "${PWD}/scripts/usermod.sh"
bash "${PWD}/scripts/setup-default-apps.sh"
bash "${PWD}/scripts/enable-services.sh"
bash "${PWD}/scripts/sync-time.sh"

echo "Installation is completed!"
