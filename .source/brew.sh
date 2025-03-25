if [[ $BREW = true ]]; then
    #Linux related Brew
    test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
    test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.bashrc
fi

#todo: Fix
# source $(brew --prefix)/zsh-autocomplete/zsh-autocomplete.plugin.zsh source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
