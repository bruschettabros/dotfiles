![image](https://github.com/user-attachments/assets/ede82fa8-a8d8-4a74-9d0d-5f18a94a519f)

# My dotfiles

A collection of dotfiles and config files that can be used for the perfect CLI experience on a new machine

## Installing

Pull down the repo 
```sh
cd ~ && git clone https://github.com/bruschettabros/dotfiles.git
```

Once you have pulled down this repo: 
 - `cd` into the repo
```
cd dotfiles
```
 - Remove/backup existing dotfile
```
cd ~ && mkdir dotbackup &&  mv .* dotbackup/; cd -
```
 - run the install script
```
./install.sh
```
Note: This will install [oh-my-zsh](https://ohmyz.sh/) and [brew](https://brew.sh/). 

If you already have these installed, comment out the relevant lines.

## Requirements

 - Zsh
 - Git
 - Curl
