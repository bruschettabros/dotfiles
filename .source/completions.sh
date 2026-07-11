source <(kubectl completion zsh)
source <(stern --completion zsh)
eval $(thefuck --alias)
brew_prefix=$(brew --prefix)
source $brew_prefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
