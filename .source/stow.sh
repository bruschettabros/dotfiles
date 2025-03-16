if [[ $STOW = true ]]; then
    echo "Stow step..."
    cd ~/dotfiles
    git stash >/dev/null 2>&1
    git pull
    # This generates a script that can be installed via:
    # brew bundle install --file ~/Brewfile
    rm -f ~/dotfiles/Brewfile
    rm -f ~/dotfiles/Brewfile.$OSTYPE
    brew bundle dump
    mv Brewfile Brewfile.$OSTYPE
    stow .
    git stash pop >/dev/null 2>&1
    cd -
fi
