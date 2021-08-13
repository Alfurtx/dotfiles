#!/usr/bin/env zsh

# === [ EXPORTS ] === #

# for not creating automatic log files of any sort
export LESSHISTFILE=-

# for putting things in .config by default
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export NVM_DIR=$XDG_CONFIG_HOME/nvm
export PYLINTHOME=$XDG_CONFIG_HOME/pylint
export DOOMDIR=$XDG_CONFIG_HOME/doom
export EMACSDIR=$XDG_CONFIG_HOME/emacs
export DOOMLOCALDIR=$EMACSDIR/.local
export CARGO_HOME=$XDG_CONFIG_HOME/cargo
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export HISTFILE=$XDG_CACHE_HOME/zsh/.zsh_history

export XAUTHORITY=$XDG_CONFIG_HOME/xorg/Xauthority
export XINITRC=$XDG_CONFIG_HOME/xorg/.xinitrc

# Path to your oh-my-zsh installation.
export ZSH=$XDG_CONFIG_HOME/oh-my-zsh
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/oh-my-zsh
export ZSH_COMPDUMP=$XDG_CACHE_HOME/zsh/zcompdump

# for putting things in .share by default
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"

# for custom commands (a.k.a 'zsh_history_fix')
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$EMACSDIR/bin:$PATH

# === [ END ] === #
