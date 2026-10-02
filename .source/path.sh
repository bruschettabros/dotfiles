path+=$HOME/.local/bin
path+=/usr/local/opt/mysql-client/bin/
path+=$HOME/.composer/vendor/bin/
path+=$HOME/.config/composer/vendor/bin
path+=$HOME/.config/toolbox
path+=/opt/homebrew/Cellar/bin
path+=/opt/homebrew/bin
path+=/opt/homebrew/opt
path+=/opt/homebrew/sbin

# .NET SDK (installed via dotnet-install.sh into ~/.dotnet)
export DOTNET_ROOT=$HOME/.dotnet
path+=$DOTNET_ROOT
path+=$DOTNET_ROOT/tools

#Needs to be first
export PATH="/usr/local/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
