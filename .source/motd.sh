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
    )
    distro=${distros[$RANDOM % ${#distros[@]}]}

    figlet -f slant "$WORK" | lolcat -t
    neofetch --ascii_distro $distro | lolcat -t
fi
