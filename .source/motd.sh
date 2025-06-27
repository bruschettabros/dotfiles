if [[ $MOTD = true ]]; then
    distros=(
        "arch"
        "mint"
        "windows"
        "manjaro"
        "debian"
        "ubuntu"
        "fedora"
        "kali"
        "netrunner"
        "netbsd"
        "alpine"
        "pop"
        "centos"
        "elementary"
        "garuda"
        "mac"
    )
    distro=${distros[$RANDOM % ${#distros[@]}]}

    figlet -f slant "$WORK" | lolcat -t
#   neofetch --ascii_distro | lolcat -t
fi
