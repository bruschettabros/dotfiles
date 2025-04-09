# On exec
export BREW=true
export STOW=false
export MOTD=false

IFS=' '
export INIT_IFS=$IFS

# Work
export WORK='evaluagent'
export LNAME='collins'
export FNAME='shaun'
export WORK_QUEUES=(
    analytics_fifo
    deepgram_fifo
    analytics_priority
    analytics
    default
    EA3_DEEPGRAM_LOCAL.fifo
    EA3_ANALYTICS_TEST.fifo
    EA3_WORKQUEUES_ASSIGN_LOCAL
    smartscore_default.fifo
    EA3_TEXT_EMBEDDING_UAT.fifo
    EA3_TEXT_MINING_UAT.fifo
)

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
*-WSL2*)
    export EMAIL=$FNAME@shaunc.co.uk
    export vlc="/mnt/c/Program Files/VideoLAN/VLC/vlc.exe"
    ;;
*)
    echo "Unknown OS: $(uname -sr)"
    ;;
esac
