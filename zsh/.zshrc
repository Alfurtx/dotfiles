#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# === [ OH-MY-ZSH + POWERLEVEL10K ] === #

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-nvm
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# === [ END ] === #

# === [ ZSH HIGHTLIGHT PLUGIN ] === #
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[command]='fg=#51afef,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#51afef,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#51afef,bold'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#51afef,bold'

# === [ END ] === #

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# === [ NVM SCRIPTS ] === #

# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
#
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

# === [ END ] === #


# === [ IMPROVED COMMANDS ] === #

alias l='exa -l --no-filesize --no-user --git --git-ignore --no-time --group-directories-first -T --level=2 --sort=Name --sort=Extension -F'
alias la='exa -l --git --git-ignore --no-time -a --group-directories-first -T --level=2 --sort=Name --sort=Extension -F'
alias lsa='exa -l --git --git-ignore --no-time -a --group-directories-first --sort=Name --sort=Extension -F'

eval "$(zoxide init zsh)"

# youtube-dl to download stuffs
alias yt='youtube-dl --extract-audio --add-metadata --xattrs --embed-thumbnail --audio-quality 0 --audio-format mp3'
alias ytv='youtube-dl --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" --embed-thumbnail --add-metadata'

# music stuff (mpd and ncmpcpp) 
alias kek=" killall mpd ncmpcpp ncmpcpp_cover_art.sh"
alias mpdd=" mpd && ~/.config/ncmpcpp/ncmpcpp-ueberzug/ncmpcpp-ueberzug"

# === [ END ] === #

# === [ ALIASES ] === #

# change .wget-hsts file by changing the command with an alias and seting a default place to store it
alias wget='wget --hsts-file=$XDG_CACHE_HOME/wget/.wget-hsts'

alias ll='ls -l'
alias vi='nvim'
alias vim='nvim'

# === [ END ] === #

# === [ AUTOSTART ] === #

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $XDG_CONFIG_HOME/powerlevel10k/p10k.zsh ]] || source $XDG_CONFIG_HOME/powerlevel10k/p10k.zsh

[[ $(fgconsole 2>/dev/null) == 1 ]] && startx -x /home/fonsi/.config/xorg/.xinitrc

# MPD daemon start (if no other user instance exists)
# [ ! -s ~/.config/mpd/mpd.pid ] && mpd

# === [ END ] === #
