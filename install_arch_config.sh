#!/bin/bash

function prereq(){
    pacman -S sudo git alacritty nvim
}

function install_dotfiles(){
    git clone https://github.com/Alfurtx/dotfiles.git
}

function install_packages(){
    echo "[FONSI SCRIPT!] Instalando los paquetes"
    sudo pacman -S $(cat installed_packages.txt)
}
