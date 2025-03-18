if [[ $STOW = true ]]; then
    echo "Stow step..."
    cd ~/dotfiles
    git pull
    # This generates a script that can be installed via:
    # brew bundle install --file ~/Brewfile
    rm -f ~/dotfiles/Brewfile
    rm -f ~/dotfiles/Brewfile.$OSTYPE
    brew bundle dump
    mv Brewfile Brewfile.$OSTYPE
    stow .
    cd -
fi
