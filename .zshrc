export ZSH=$HOME"/.oh-my-zsh"

# ZSH_THEME="amuse"
# ZSH_THEME="jonathon"
ZSH_THEME="fino-time"

plugins=(git httpie laravel web-search docker docker-compose jira colored-man-pages vscode artisan tmux golang)

source $ZSH/oh-my-zsh.sh

source ~/.source/path.sh
source ~/.source/variables.sh
source ~/.source/alias.sh
source ~/.source/secretManagerCommands.sh

source ~/.source/stow.sh
source ~/.source/brew.sh
source ~/.source/motd.sh
# source ~/.source/tmux.sh
source ~/.source/completions.sh

setVim lvim
export EDITOR='lvim'

eval $(thefuck --alias)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
