export ZSH=$HOME"/.oh-my-zsh"

# ZSH_THEME="amuse"
# ZSH_THEME="jonathon"
ZSH_THEME="fino-time"

plugins=(git httpie laravel web-search docker docker-compose jira colored-man-pages vscode artisan tmux golang)

source $ZSH/oh-my-zsh.sh

setVim() {
alias vim="$@"
}
setVim nvim
export EDITOR='nvim'

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
