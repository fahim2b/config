#!/usr/bin/bash
apt install openjdk-21-jdk ghostty ncdu aria2 curl git wget fzf ffuf krita cava zsh gthumb vim -y


# this should't run on root
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# installing flatpak
apt install flatpak
apt install gnome-software-plugin-flatpak
apt install plasma-discover-backend-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo


aria2c -x 10 'https://go.dev/dl/go1.24.3.linux-amd64.tar.gz'
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.24.3.linux-amd64.tar.gz

# Downloading the .zshrc .vimrc .ghostty to github
git clone github.com/fahim2b/config
mv ~/config/.zshrc ~
mv ~/config/.vimrc ~
mkdir -p .config/ghostty
mv ~/config/config .config/ghostty/

# Download the driver
wget https://veikk.com/image/catalog/Software/vktablet-3.5.8-3.x86_64-1.deb
dpkg -i vktablet-3.5.8-3.x86_64-1.deb

# Todo make the forn work 

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/ComicShannsMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/NerdFontsSymbolsOnly.zip

aria2c -x 10 'https://github.com/obsidianmd/obsidian-releases/releases/download/v1.8.10/obsidian_1.8.10_amd64.deb'


# Themes for gnome

# install and setup rofi

# list if gnome extantantion 

# Nordic-Darker

# Blur my Shell
# Resource Monitor
# User Themes


# Installing some security tools
# amass                   chameleon  gopls    gowitness  httpx   kr           waybackurls
# analyticsrelationships  dnsx       gotator  httprobe   katana  staticcheck
