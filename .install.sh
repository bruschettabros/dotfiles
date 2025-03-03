OS=$(uname)

#Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Brew 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#Brewfile
brew bundle install --file=~/.dotfiles/Brewfile.$OSTYPE || echo "No Brewfile for $OSTYPE"

#LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

#Stow dotfiles
cd ~/.dotfiles
stow .
exec zsh
