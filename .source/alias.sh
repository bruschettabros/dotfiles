#Aliases
alias copy="pbcopy"
alias paste="pbpaste"
alias so="exec zsh"
alias c="clear"
#alias cat="bat"
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
alias awssso="sh /Users/shaun/Projects/evaluagent/local-dev/aws-access.sh -f  /Users/shaun/Projects/evaluagent/evaluagent/.env"
alias a="artisan"
alias at="a tinker"
alias am="a migrate"
alias amr="a migrate:rollback"
alias dump="composer dump"
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
alias vz="v ~/dotfiles/.zshrc"

#Functions
function monitor_ea_workers() {
    # Check if running inside tmux
    if [ -z "$TMUX" ]; then
        echo "Not currently in a tmux session. Please run this from within tmux."
        return 1
    fi

    # Check if stern is available
    if ! command -v stern &>/dev/null; then
        echo "stern is not installed. Please install it first."
        return 1
    fi

    local workers=(
        "analytics"
        "transcription"
        "text-mining"
        "text-embedding"
        "smartscore"
    )

    tmux new-window -n "ea-workers"

    local num_workers=${#workers[@]}

    # Split panes for each worker (except the first one)
    for ((i = 1; i < $num_workers; i++)); do
        tmux split-window -v
        # Even distribution
        tmux select-layout even-vertical
    done

    # Start stern in each pane
    for ((i = 1; i <= $num_workers; i++)); do
        tmux send-keys -t :.$(($i - 1)) "stern deployment/ea-${workers[$i]}-worker -e \"${workers[$i]}\" -e \"production\.DEBUG\" -e \"production\.INFO\" -e \"RUNNING\"" C-m
    done

    # Select the first pane
    tmux select-pane -t :.0
}

mkcd() {
    mkdir -p "$1" && cd "$1"
}

gpush() {
    git stash && git checkout $1 && git fetch && git pull && git merge - && git push && git checkout - && git stash pop
}

topcommands() {
    history | awk '{print $2}' | sort | uniq -c | sort -rn | head -$1
}

change() {
    git stash && git checkout $1 && git stash pop

}
countpods() {
    kubectl get pods | grep Running | awk '{print $1}' | sed 's/\-.....$//g' | sort | uniq -c
}

update-all() {
    omz update
    brew update
}

fresize() {
    #arguments: 1 = output, 2 = output, 3 = width
    ffmpeg -i "$1" -vf scale=$3:-1 -q:v 1 "$2"
}

jqp() {
    jq <<<"$1"
}

vs() {
    "$@" | v -
}

cheat() {
    curl cheat.sh/"$@" | less
}

scheckout() {
    git stash
    git checkout $1
    git pull
    git stash pop
}
merge-develop() {
    git checkout develop
    git pull
    git checkout -
    git merge develop
}

analyse() {
    # $1 = integrationId
    # $2 = fcUuid
    php artisan analytics:dispatch-single-fetched-contact-for-analytics $1 $2
}

mtgRandom() {
    curl -s https://api.scryfall.com/cards/random | jq -r '.image_uris.normal'
}

mtgGenerate() {
    wget $(mtgRandom) -O ~/Pictures/mtg/$(uuid).jpg
}

#Kubernetes
alias k=kubectl
alias kgp="k get pods"
alias kgd="k get deploy"

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
