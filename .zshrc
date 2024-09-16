export ZSH=$HOME"/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git httpie laravel web-search docker docker-compose jira colored-man-pages vscode artisan tmux golang)

source $ZSH/oh-my-zsh.sh


path+=$HOME/.local/bin
path+=/Users/shaun/.local/bin
path+=/usr/local/opt/mysql-client/bin/
path+=$HOME/.composer/vendor/bin/
path+=$HOME/.config/composer/vendor/bin
path+=$HOME/.config/toolbox
path+=/opt/homebrew/Cellar/bin

export PATH="/usr/local/sbin:$PATH"

source ~/.source/variables.sh
source ~/.source/alias.sh
source ~/.source/secretManagerCommands.sh
source ~/.powerlevel.conf

source ~/.source/stow.sh
source ~/.source/brew.sh
source ~/.source/motd.sh

setVim lvim
export EDITOR='lvim'

eval $(thefuck --alias)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
