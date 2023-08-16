# ~/.zprofile

# Load environment variables 
[ -f $HOME/.config/zsh/.zshenv ]  && source -- $HOME/.config/zsh/.zshenv

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # incluse .bashrc if it exists 
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# include user's bin directory
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"

# put /usr/sbin on path so you don't have to e.g `sudo reboot`
PATH="/usr/sbin:$PATH"

# Start ssh-agent
eval $(ssh-agent)
