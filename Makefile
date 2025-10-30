all:
	@sh ./scripts/all.sh

add-missing-repos:
	@sh ./scripts/add-missing-repos.sh

copy-desktop-config:
	@sh ./scripts/copy-desktop-config.sh

copy-timeshift-config:
	@sh ./scripts/copy-timeshift-config.sh

enable-services:
	@sh ./scripts/enable-services.sh

hide-desktop-apps:
	@sh ./scripts/hide-desktop-apps.sh

install-cargo-packages:
	@sh ./scripts/install-cargo-packages.sh

install-corefonts:
	@sh ./scripts/install-corefonts.sh

install-flatpak-packages:
	@sh ./scripts/install-flatpak-packages.sh

install-gitflow-cjs:
	@sh ./scripts/install-gitflow-cjs.sh

install-gnome-extensions:
	@sh ./scripts/install-gnome-extensions.sh

install-lazydocker:
	@sh ./scripts/install-lazydocker.sh

install-lazygit:
	@sh ./scripts/install-lazygit.sh

install-jetbrains-mono:
	@sh ./scripts/install-jetbrains-mono.sh

install-multimedia-codecs:
	@sh ./scripts/install-multimedia-codecs.sh

install-nvm:
	@sh ./scripts/install-nvm.sh

install-system-packages:
	@sh ./scripts/install-system-packages.sh

remove-unused-packages:
	@sh ./scripts/remove-unused-packages.sh

remove-unused-repos:
	@sh ./scripts/remove-unused-repos.sh

setup-cursor-theme:
	@sh ./scripts/setup-cursor-theme.sh

setup-default-apps:
	@sh ./scripts/setup-default-apps.sh

setup-gtk-theme:
	@sh ./scripts/setup-gtk-theme.sh

setup-icon-theme:
	@sh ./scripts/setup-icon-theme.sh

setup-look:
	@sh ./scripts/setup-look.sh

setup-nvidia:
	@sh ./scripts/setup-nvidia.sh

setup-nvidia-hybrid:
	@sh ./scripts/setup-nvidia-hybrid.sh

setup-swap:
	@sh ./scripts/setup-swap.sh

sync-time:
	@sh ./scripts/sync-time.sh

usermod:
	@sh ./scripts/usermod.sh


