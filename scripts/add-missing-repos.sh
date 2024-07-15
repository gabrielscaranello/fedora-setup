#! /bin/bash

_add_factory_repo() {
	echo "Adding factory repo..."

	sudo zypper addrepo https://download.opensuse.org/repositories/openSUSE:Factory/standard/openSUSE:Factory.repo

	echo "Factory repo added."
}

_add_google_chrome_repo() {
	echo "Adding google chrome repo..."

	sudo rpm --import https://dl.google.com/linux/linux_signing_key.pub
	sudo tee /etc/zypp/repos.d/google-chrome.repo >/dev/null <<EOF
[google-chrome]
name=google-chrome
enabled=1
autorefresh=1
baseurl=https://dl.google.com/linux/chrome/rpm/stable/x86_64
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
type=rpm-md
keeppackages=0
EOF

	echo "Google chrome repo added."
}

_add_vscode_repo() {
	echo "Adding vscode repo..."

	echo "Removing old files if exists..."
	sudo rm -rf /etc/zypp/repos.d/vscode.repo

	echo "Adding vscode repo..."
	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
	sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode vscode

	echo "vscode repo added."
}

echo "Adding missing repos..."
_add_factory_repo
_add_google_chrome_repo
_add_vscode_repo
sudo zypper refresh
echo "Missing repos added."
