# ~/.zprofile

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"
PATH="/usr/sbin:$PATH"

[ -f $HOME/.config/zsh/.zshenv ]  && source -- $HOME/.config/zsh/.zshenv
