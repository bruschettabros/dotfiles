export ZSH=$HOME"/.oh-my-zsh"

# ZSH_THEME="amuse"
# ZSH_THEME="jonathon"
ZSH_THEME="fino-time"

plugins=(iterm2 git httpie laravel web-search docker docker-compose jira colored-man-pages vscode artisan tmux golang)

source $ZSH/oh-my-zsh.sh

setVim() {
alias vim="$@"
}
setVim nvim
export EDITOR='nvim'
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR

export EMAIL='shaun.collins@evaluagent.com'
GIT_COMMITTER_EMAIL=$EMAIL
GIT_AUTHOR_EMAIL=$EMAIL

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
