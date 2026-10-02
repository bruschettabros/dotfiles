OS=$(uname)

#Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#Brewfile
brew bundle install --file=~/.dotfiles/Brewfile.$OSTYPE || echo "No Brewfile for $OSTYPE"

#Stow dotfiles
cd ~/.dotfiles
stow .

#Herdr plugins
~/.config/herdr/install-plugins.sh || echo "herdr plugin install failed"
exec zsh
