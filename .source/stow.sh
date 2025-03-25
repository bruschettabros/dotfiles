if [[ $STOW = true ]]; then
    cd ~/dotfiles
    git pull >/dev/null 2>&1
    generate_brewfile
    stow .
    cd - >/dev/null 2>&1
fi
