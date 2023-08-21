# ~/.zprofile

# Load environment variables 
[ -f $HOME/.config/zsh/.zshenv ] && source -- $HOME/.config/zsh/.zshenv

# Include user's bin directory
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"

# Put /usr/sbin on path so you don't have to e.g `sudo reboot`
PATH="/usr/sbin:$PATH"

# Start ssh-agent
eval $(ssh-agent)
