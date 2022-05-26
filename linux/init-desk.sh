#!/bin/bash
set -x

# install vmware tools
sudo apt install open-vm-tools open-vm-tools-desktop -y

# update OS
sudo apt update; sudo apt upgrade -y

# add a few favorites
sudo apt install vim htop p7zip-full -y

# install brave browser
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

# add appimage support and favorite AppImages
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt update
sudo apt install appimagelauncher -y
cd ~/Downloads
MDEDIT_FILE_VER=0.14.6
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v$MDEDIT_FILE_VER/Obsidian-$MDEDIT_FILE_VER.AppImage
chmod +x Obsidian-$MDEDIT_FILE_VER.AppImage

# install aws-cli using home directory for DL
cd ~
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version

# setup aws-cli
aws configure
