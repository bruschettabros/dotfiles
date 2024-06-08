# My dotfiles

A collection of dotfiles and config files that can be used when setting up a new machine My dot files

## Installing

This repo relies on `stow`
```sh
brew install stow
```

Once you have pulled down this repo: 
 - `cd` into repo
 - Remvove/backup existing dotfile
```
cd ~ && mkdir dotbackup &&  mv .* dotbackup/
```
 - run `stow .`
 - run `exec zsh` and `.zshrc` will take care of the rest

## Requirements

 - Zsh
 - Brew
 - Git
