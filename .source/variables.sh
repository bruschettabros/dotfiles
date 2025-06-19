# On exec
export BREW=true
export STOW=false
export MOTD=false

IFS=' '
export INIT_IFS=$IFS

# Work
export WORK='Ceedbox'
export DOMAIN='com'
export LNAME='collins'
export FNAME='shaun'

# Git
export EMAIL="$FNAME.$LNAME@$WORK.$DOMAIN"
export GIT_COMMITTER_EMAIL=$EMAIL
export GIT_AUTHOR_EMAIL=$EMAIL
export GIT_COMMITTER_NAME="$FNAME $LNAME"

# Editor
export EDITOR='nvim'
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR

# Misc
export PROJECTS=~/Projects
export WORK_DIR=$PROJECTS/$WORK

export WORK_PROJECTS=(
    $WORK_DIR/hush
    $WORK_DIR/tobe
    $WORK_DIR/container-chase
)
#Php
export XDEBUG_SERVER=Ceedbox.test
export XDEBUG_PROFILER_DIR=$PROJECTS/Profiler

# OS Specific
case "$(uname -sr)" in
Darwin*)
    export vlc="/Applications/VLC.app/Contents/MacOS/VLC"
    ;;
*-WSL2*)
    export vlc="/mnt/c/Program Files/VideoLAN/VLC/vlc.exe"
    ;;
*)
    echo "Unknown OS: $(uname -sr)"
    ;;
esac
