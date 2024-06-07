#Aliases
alias copy="pbcopy"
alias paste="pbpaste"
alias so="exec zsh"
alias c="clear"
alias cat="bat"
alias v="vim"
alias artisan="/Users/shaun/Projects/evaluagent/evaluagent/artisan"
alias ll='ls -larh'
alias phps="phpstorm"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gls="gl --stat"
alias glo="gl --oneline"
alias pls="fuck"
alias p="/Users/shaun/Projects; ll"
alias flushdns="sudo systemd-resolve - -flush-caches"
alias gs="git status"
alias sail="./vendor/bin/sail"
alias s="sail"
alias sd="s down"
alias sam="s artisan migrate"
alias sud="s up -d"
alias samr="s artisan migrate:rollback"
alias sat="s artisan tinker"
alias awssso="sh /Users/shaun/Projects/evaluagent/local-dev/aws-access.sh -f  /Users/shaun/Projects/evaluagent/evaluagent/.env"
alias a="artisan"
alias at="a tinker"
alias am="a migrate"
alias phpx="PHP_IDE_CONFIG='serverName=Evaluagent.test' \
    php \
    -dxdebug.mode=debug \
    -dxdebug.client_host=127.0.0.1 \
    -dxdebug.start_with_request=yes"


alias phpp="PHP_IDE_CONFIG='serverName=evaluagent.test' \
    php \
    -dxdebug.mode=profile \
    -dxdebug.client_host=127.0.0.1 \
    -dxdebug.start_with_request=yes \
    -dxdebug.output_dir=/Users/shaun/Projects/Profiler"
alias uuid=uuidgen
alias poke="fortune | pokemonsay -n -w 30"
#Functions
update-all() {
omz update
brew update
lvim +LvimUpdate +q
}

fresize () {
    ffmpeg -i "$1" -vf scale=$3:-1 "$2" 
}

vs () {"$@" | v - }
cheat () {curl cheat.sh/"$@" | less}

scheckout () {
    git stash;
    git checkout $1;
    git stash pop;
}
merge-develop() {
git checkout develop;
git pull;
git checkout -;
git merge develop;
}

setVim () {
alias vim="$1"
}

#Tmux related
alias t="tmux"
alias tl="tmux ls"
alias td="tmux detach"
tnew() {
    tmux new-session -s $1
}
tatt() {
    tmux attach -t $1
}
tkill() {
    tmux kill-session -t $1
}
