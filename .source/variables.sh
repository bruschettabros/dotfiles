# On exec
export BREW=true
export STOW=true
export MOTD=false
export DEFAULT_TMUX=false

# Git
export EMAIL='shaun.collins@evaluagent.com'
export GIT_COMMITTER_EMAIL=$EMAIL
export GIT_AUTHOR_EMAIL=$EMAIL

# Editor
export EDITOR='nvim'
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR

case "$(uname -sr)" in
# OS Specific
Darwin*)
    export vlc="/Applications/VLC.app/Contents/MacOS/VLC"
    ;;
Linux*Microsoft*)
    # WSL
    export vlc="/mnt/c/Program Files/VideoLAN/VLC/vlc.exe"
    ;;
*)
    echo 'Unknown OS...'
    ;;
esac
