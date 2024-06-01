export ZSH="/Users/shaun/.oh-my-zsh"

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git httpie laravel web-search docker docker-compose jira colored-man-pages vscode artisan tmux golang)

source $ZSH/oh-my-zsh.sh

path+=/usr/local/opt/mysql-client/bin/
path+=$HOME/.composer/vendor/bin/
path+=$HOME/.config/composer/vendor/bin
path+=$HOME/.config/toolbox
path+=$HOME/.local/bin
path+=/opt/homebrew/Cellar/bin
path+=/Users/shaun/.local/bin


source ~/.alias.sh
source ~/.secretManagerCommands.sh
source ~/.powerlevel.conf

setVim lvim

export PATH="/usr/local/sbin:$PATH"
export EDITOR='lvim'

cd ~/dotfiles
# This generates a script that can be installed via:
# brew bundle install --file ~/Brewfile
rm -f ~/dotfiles/Brewfile
brew bundle dump
stow .
cd -

eval $(thefuck --alias)
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

neofetch
