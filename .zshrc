#!/usr/bin/env zsh

export ZSH=$HOME"/.oh-my-zsh"

ZSH_THEME="fino-time"
POSH_THEME="~/.source/prompt.json"

source $ZSH/oh-my-zsh.sh



source ~/.source/path.sh
source ~/.source/variables.sh
source ~/.source/alias.sh
source ~/.source/secretManagerCommands.sh
source ~/.source/fzf.sh

# Order matters! 
source ~/.source/brew.sh
source ~/.source/stow.sh
source ~/.source/motd.sh
source ~/.source/tmux.sh

source ~/.source/nvm.sh
source ~/.source/completions.sh

source ~/.source/bindings.sh

plugins=(
    iterm2
    git
    httpie
    laravel
    web-search
    docker
    docker-compose
    jira
    colored-man-pages
    vscode
    artisan
    tmux
    golang
    ssh
)

setVim $EDITOR

eval "$(oh-my-posh init zsh --config $POSH_THEME)"
