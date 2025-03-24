# On exec
export BREW=true
export STOW=true
export MOTD=false

# Work
export WORK='evaluagent'
export LNAME='collins'
export FNAME='shaun'

# Git
export EMAIL="$FNAME.$LNAME@$WORK.com"
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

#Php
export XDEBUG_SERVER=Evaluagent.test
export XDEBUG_PROFILER_DIR=$PROJECTS/Profiler

# OS Specific
case "$(uname -sr)" in
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
