#!/bin/bash

function instalarDriversIntel(){
    cd
    read -p "[FONSI] Estas tratando de instalarlo en el portatil? [y/n]" yn
    case $yn in
        [yY])
            sudo pacman -S xf86-video-intel
            ;;
    esac
}

# Check we have git installed
function instGit(){
    if ! pacman -Qi git > /dev/null ; then
        echo "[FONSI] git is not installed on the system, proceding to install..."
        sudo pacman -S git
    fi
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


# Now we download the dotfiles repo and move it to a .config
function installDotfiles(){
    echo "[FONSI] installing dotfiles..."
    cd
    git clone https://github.com/Alfurtx/dotfiles.git
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
    sudo pacman -Sy $(cat $HOME/.config/packages.txt)

    echo "[FONSI] installing pacman aur packages..."
    # Installing the AUR packages
    yay -S $(cat $HOME/.config/aur_packages.txt)
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
    mv .config/.xinitrc $HOME
    mv .config/.zshrc $HOME
    mv .config/.p10k.zsh $HOME
}

function main(){
    instalarDriversIntel
    instGit
    installXorgShit
    installDotfiles
    instYay
    createConfigDir
    install_packages
    moveItToAConfig
    installOhMyZsh
}
