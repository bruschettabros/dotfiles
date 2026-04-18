# On exec
export BREW=true
export STOW=false
export MOTD=true

IFS=' '
export INIT_IFS=$IFS

# Work
export WORK='Franscape'
export DOMAIN='io'
export LNAME='Collins'
export FNAME='Shaun'

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
    $PROJECTS/customer-portal/
    $PROJECTS/lesson-finder/
    $PROJECTS/web-applications/
)
export HOME_LAB=(
    $PROJECTS/Cloudreve
    $PROJECTS/Dockhand
    $PROJECTS/JellyFin
    $PROJECTS/NginxReverseProxy
    $PROJECTS/Newt
    $PROJECTS/Gitea
    $PROJECTS/Tools
    $PROJECTS/Vikunja/
)

#Php
export XDEBUG_SERVER=main.backend-api.orb.local
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
