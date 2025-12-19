#Aliases

#Utility
alias copy="pbcopy"
alias paste="pbpaste"
alias so="source ~/.zshrc"
alias c="clear"
alias v="vim"
alias pls="fuck"
alias l="eza  --long --color=always --icons=always -a"
alias p="cd $WORK_DIR; l"
alias ace="cd ~/Projects/Ace"
alias ll='ls -larh'
alias uuid=uuidgen
alias poke="fortune | pokemonsay -n -w 30"
alias vz="v ~/dotfiles/.zshrc"
alias flushdns="sudo systemd-resolve - -flush-caches"

alias phpx="PHP_IDE_CONFIG='serverName=$XDEBUG_SERVER' \
    php \
    -dxdebug.mode=debug \
    -dxdebug.client_host=0.0.0.0 \
    -dxdebug.start_with_request=yes"

alias phpp="PHP_IDE_CONFIG='serverName=$XDEBUG_SERVER' \
    php \
    -dxdebug.mode=profile \
    -dxdebug.client_host=127.0.0.1 \
    -dxdebug.start_with_request=yes \
    -dxdebug.output_dir=$XDEBUG_PROFILER_DIR"

#git
alias g="git"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gls="gl --stat"
alias glo="gl --oneline"
alias gs="git checkout"

#sail
alias sail="./vendor/bin/sail"
alias s="sail"
alias sd="s down"

#php
alias artisan="sail artisan"
alias phps="phpstorm"
alias a="artisan"
alias at="a tinker"
alias am="a migrate"
alias amr="a migrate:rollback"
alias dump="composer dump"

#work

#Kubernetes
alias k=kubectl
alias kgp="k get pods"
alias kgd="k get deploy"

#Tmux
alias t="tmux"
alias tl="tmux ls"
alias td="tmux detach"

#WSL
alias wslhost="/mnt/c/Windows/System32/drivers/etc/hosts"

#Utility
resetIfs() {
    IFS=$INIT_IFS
}

dssh() {
    docker exec -ti "$1" sh
}

dps() {
    docker ps -q --filter="name=$1" | head -1
}

dsshs() {
    dssh $(dps "$1")
}

mkcd() {
    mkdir -p "$1" && cd "$1"
}

topcommands() {
    history | awk '{print $2}' | sort | uniq -c | sort -rn | head -$1
}

update-all() {
    mas upgrade
    brew update
    omz update
}

generate_brewfile() {
    # This generates a script that can be installed via:
    # brew bundle install --file ~/Brewfile
    rm -f ~/dotfiles/Brewfile
    rm -f ~/dotfiles/Brewfile.$OSTYPE
    brew bundle dump
    mv Brewfile Brewfile.$OSTYPE
}

fresize() {
    #arguments: 1 = output, 2 = output, 3 = width
    ffmpeg -i "$1" -vf scale=$3:-1 -q:v 1 "$2"
}

jqp() {
    jq <<<"$1"
}

cheat() {
    IFS='/'
    curl cheat.sh/"$*" | less
    resetIfs
}

learn() {
    cheat "$1" ":learn"
}

#vim
vs() {
    "$@" | $EDITOR -
}

setVim() {
    alias vim="$*"
}

#git
change() {
    git stash && git checkout $1 && git stash pop

}

gpush() {
    git stash && git checkout $1 && git fetch && git pull && git merge - && git push && git checkout - && git stash pop
}

scheckout() {
    git stash
    git checkout $1
    git pull
    git stash pop
}

merge-current() {
    git checkout release/current
    git pull
    git checkout -
    git merge develop
}

checkout-current() {
    git checkout release/current
    git pull
}

#work

usephp() {
    brew unlink php && brew link --force php@"$1"
}

startProjects() {
    cd $WORK_DIR/proxy-manager
    docker-compose up -d
    cd -

    for project in $WORK_PROJECTS; do
        echo "Starting $project ..."
        cd $project && sail up -d
        cd -
    done

}

endProjects() {
    cd $WORK_DIR/proxy-manager
    docker-compose down
    cd -

    for project in $WORK_PROJECTS; do
        echo "Ending $project ..."
        cd $project && sail down
        cd -
    done
}

startQueues() {
    IFS=','
    timeout="${1:-7200}"
    phpx artisan queue:work --timeout=$timeout --queue="${WORK_QUEUES[*]}"
    resetIfs
}

countpods() {
    kubectl get pods | grep Running | awk '{print $1}' | sed 's/\-.....$//g' | sort | uniq -c
}

#fun
mtgRandom() {
    curl -s https://api.scryfall.com/cards/random | jq -r '.image_uris.normal'
}

mtgGenerate() {
    wget $(mtgRandom) -O ~/Pictures/mtg/$(uuid).jpg
}

#Video
streamVideo() {
    yt-dlp -o - "$1" | $vlc -
}

downloadVideo() {
    yt-dlp -o "$2" "$1"
}

#tmux
tnew() {
    tmux new-session -s "$1"
}
tatt() {
    tmux attach -t "$1"
}
tkill() {
    tmux kill-session -t "$1"
}
tsave() {
    ~/.tmux/plugins/tmux-resurrect/scripts/save.sh
}

tload() {
    ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh
}
