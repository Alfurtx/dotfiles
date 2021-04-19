#!/bin/bash

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
}

function install_packages(){
    echo "[FONSI] installing pacman packages..."
    # Installing the pacman packages
    sudo pacman -Sy $(cat $HOME/.config/packages.txt)

    echo "[FONSI] installing pacman aur packages..."
    # Installing the AUR packages
    yay -S $(cat $HOME/.config/aur_packages.txt)
}

# Once every package is installed is time to install extra things
# First, we're gonna configure firefox
# Secondly, we're going to configure zsh and oh-my-zsh

function installOhMyZsh(){
    # This install ohmyzsh
    sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

    # install plugins
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
}

function moveItToAConfig(){
    cd
    mkdir .config
    mv ./dotfiles/* ./config/
    cd
}

instGit
installXorgShit
instYay
installDotfiles
install_packages
installOhMyZsh
moveItToAConfig
