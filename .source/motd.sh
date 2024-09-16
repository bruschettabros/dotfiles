if [[ $MOTD = true ]]
then
    echo "MOTD step..."
    distros=("arch" "mint" "manjaro" "windows" "debian" "ubuntu" "fedora" "kali" "netrunner" "netbsd")
    distro=${distros[ $RANDOM % ${#distros[@]} ]}
    neofetch --ascii_distro $distro  | lolcat -t
fi
