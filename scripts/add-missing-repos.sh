#! /bin/bash

_add_bottom_repo() {
	echo "Adding bottom repo..."
	sudo dnf copr enable atim/bottom -y
	echo "bottom repo added."
}

_add_docker_repo() {
	echo "Adding docker repo..."

	echo "Removing old files if exists..."
	sudo rm -rf /etc/yum.repos.d/docker-ce.repo

	echo "Adding docker repo..."
	sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

	echo "docker repo added."
}

_add_rpmfusion_repo() {
	echo "Adding rpmfusion repo..."

	echo "Removing old files if exists..."
	sudo rm -rf /etc/yum.repos.d/rpmfusion.repo

	echo "Adding rpmfusion repo..."
	sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
	sudo dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

	echo "rpmfusion repo added."
}

_add_vscode_repo() {
	echo "Adding vscode repo..."

	echo "Removing old files if exists..."
	sudo rm -rf /etc/yum.repos.d/vscode.repo

	echo "Adding vscode repo..."
	sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
	echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo >/dev/null

	echo "vscode repo added."
}

echo "Adding missing repos..."
_add_bottom_repo
_add_docker_repo
_add_rpmfusion_repo
_add_vscode_repo
sudo dnf update -y
echo "Missing repos added."
