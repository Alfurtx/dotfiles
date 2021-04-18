#!/bin/bash

function prereq(){
    pacman -S sudo
}

function install_dotfiles(){
}

function install_packages(){
    echo "[FONSI SCRIPT!] Instalando los paquetes"
    sudo pacman -S $(cat installed_packages.txt)
}
