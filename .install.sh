OS=$(uname)

#Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Brew 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#Brewfile
brew bundle install --file=~/.dotfiles/Brewfile.$OSTYPE || echo "No Brewfile for $OSTYPE"

#Lvim
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)


#Stow dotfiles
cd ~/.dotfiles
stow .
exec zsh
