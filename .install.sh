OS=$(uname)

#Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Powerlevel9k theme
$ git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

#Brew 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#Brewfile
brew bundle install --file=~/.dotfiles/Brewfile.$OS || echo "No Brewfile for $OS"
#Lvim
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)

#Alacritty
git clone https://github.com/alacritty/alacritty-theme.git ~/.config/alacritty/alacritty-theme

#Stow dotfiles
cd ~/.dotfiles
stow .
exec zsh
