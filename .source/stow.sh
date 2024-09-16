if [[ $STOW = true ]]
then
    echo "Stow step..."
    cd ~/dotfiles
    git pull
    # This generates a script that can be installed via:
    # brew bundle install --file ~/Brewfile
    rm -f ~/dotfiles/Brewfile
    rm -f ~/dotfiles/Brewfile.$OS
    brew bundle dump
    mv Brewfile Brewfile.$OS
    stow .
    cd -
fi
