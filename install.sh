#!/bin/bash

function instPkgsVirtBox(){
    cd
    read -p "[FONSI] estas instalando en una maquina virtual? [y/n]" yn
    case $yn in
        [yY])
            sudo pacman -S virtualbox-guest-utils xf86-video-vmware
            ;;
    esac
}

function instalarDriversIntel(){
    cd
    read -p "[FONSI] Estas tratando de instalarlo en el portatil? [y/n]" yn
    case $yn in
        [yY])
            sudo pacman -S xf86-video-intel
            ;;
    esac
}

function installXorgShit(){
    sudo pacman -S xorg xorg-xinit
}

function set_startx_automatically(){
    echo "[FONSI] setting up automatic startx on .bashrc"
    cd
    echo -e "[[ $(fgconsole 2> /dev/null) == 1]] && exec startx --vt1" >> .bashrc
    echo -e "setxkbdmap es" >> .bashrc
    cd
}

function instYay(){
    echo "[FONSI] installing yay dependencies..."
    # Installing base-devel
    sudo pacman -S base-devel

    # Download and install yay
    echo "[FONSI] installing yay..."
    cd
    git clone https://aur.archlinux.org/yay-git.git
    cd yay-git/
    makepkg -si
    cd
}

function install_packages(){
    echo "[FONSI] installing pacman packages..."
    # Installing the pacman packages
    yay -S $(cat $HOME/dotfiles/packages.txt)

    echo "[FONSI] installing pacman aur packages..."
    # Installing the AUR packages
    yay -S $(cat $HOME/dotfiles/aur_packages.txt)
}

function installOhMyZsh(){
    # This install ohmyzsh
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
}

function createConfigDir(){
    cd
    mkdir .config
    cd
}

function moveItToAConfig(){
    cd
    mv ./dotfiles/* ./config/
    cd
    mv dotfiles/.zshr $HOME
    mv dotfiles/.zshrc $HOME
    mv dotfiles/.p10k.zsh $HOME
}

function main(){
    sudo pacman -Syu
    createConfigDir
    instalarDriversIntel
    instPkgsVirtBox
    installXorgShit
    instYay
    install_packages
    moveItToAConfig
    installOhMyZsh
}
