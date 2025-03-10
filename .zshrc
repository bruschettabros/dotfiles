export ZSH=$HOME"/.oh-my-zsh"

# ZSH_THEME="amuse"
# ZSH_THEME="jonathon"
ZSH_THEME="fino-time"

plugins=(iterm2 git httpie laravel web-search docker docker-compose jira colored-man-pages vscode artisan tmux golang)

source $ZSH/oh-my-zsh.sh

export EMAIL='shaun.collins@evaluagent.com'
export GIT_COMMITTER_EMAIL=$EMAIL
export GIT_AUTHOR_EMAIL=$EMAIL

export EDITOR='nvim'
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR

setVim() {
alias vim="$@"
}
setVim $EDITOR

source ~/.source/path.sh
source ~/.source/variables.sh
source ~/.source/alias.sh
source ~/.source/secretManagerCommands.sh
source ~/.source/bindings.sh

# source ~/.source/stow.sh
# source ~/.sourc/brew.sh
# source ~/.source/motd.sh
# source ~/.source/tmux.sh

source ~/.source/completions.sh
source ~/.source/nvm.sh

uptime
