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

source ~/.config/zsh/zsh_highlight
source ~/.config/zsh/zsh_completion
source ~/.config/zsh/zsh_scripts
source ~/.config/zsh/zsh_ssh
source ~/.config/zsh/zsh_aliases
source ~/.config/zsh/zsh_autostart
