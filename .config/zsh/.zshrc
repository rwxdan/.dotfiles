if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# "If not running interactively, don't do anything"
[[ $- != *i* ]] && return

# Append user functions and subsequent dirs to the functions path 
fpath=(
  ${ZDOTDIR}/site-functions
  ${ZDOTDIR}/functions
  ${ZDOTDIR}/function/**/*~*/(CVS)#(/N)
  ${ZDOTDIR}/functions/zsh-completions/src
  "${fpath[@]}"
)

# Set HISTFILE location
declare -x HISTFILE=${XDG_DATA_HOME}/zsh/zsh_history

# Set HISTSIZE to 5k lines (in the current session)
declare -x HISTSIZE=5000

# Set SAVEHIST to 10k lines (in the HISTFILE)
declare -x SAVEHIST=10000

# List of characters that should be considered as part of a word
declare -x WORDCHARS="*?_-~=&;.!#$%^"

# Disable End-Of-Line mark (%)
declare -x PROMPT_EOL_MARK=''

# setopt's array
declare -a OPTS=(
  "autocd"
  "extended_history"
  "extendedglob"
  "hist_expire_dups_first"
  "hist_ignore_dups"
  "hist_ignore_space"
  "hist_save_no_dups"
  "hist_verify"
  "inc_append_history"
  "globdots"
  "nomatch"
)

setopt ${OPTS[@]}
unset OPTS
# Turn off annoying beeps - TTY oriented
unsetopt beep

# Use emacs keybinds
bindkey -e

# Use CTRL + Left to move backward one word
bindkey '^[[1;5D' backward-word

# Use CTRL + Right to move forward one word
bindkey '^[[1;5C' forward-word

# Use CTRL + Backspace to delete one word backwards
bindkey '^H' backward-kill-word

# Use CTRL + Delete to delete one word forwards
bindkey ';5~' kill-word

# Load & initialize the built-in completion function
autoload -Uz compinit; compinit

# Let's cache completion
zstyle ':completion:*' use-cache on
# In the cache dir (sorry I can't help it)
zstyle ':completion:*' cache-path ${XDG_CACHE_HOME}/zsh/zcompcache

# Don't expand // to /*/, instead expand it to /
zstyle ':completion:*' squeeze-slashes true

# I make a lot of typos, 
# let's fuzzy-fix 'em with the completion system
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Let's ignore completion functions for commands I don't have in path
zstyle ':completion:*:functions' ignored-patterns '_*'

# Use a selection menu
zstyle ':completion:*:*:xdvi:*' menu yes select
# and, whenever it's possible, sort its order by time
zstyle ':completion:*:*:xdvi:*' file-sort time

# This is a good one, when using the `kill` command:
# Use a menu to list the processes, which also contains their names (!!!)
# It can also complete by processes IDs
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

# Let's make completion matches case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Colorize my output
if [[ -x $(command -v dircolors) ]]; then
    test -r ~/.dir_colors && \
        eval "$(dircolors -b ~/.dir_colors)" || \
        eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        alias dir='dir --color=auto'
        alias la="ls --color=auto"
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias dmesg='dmesg --color'
        alias egrep='egrep --color=auto'
fi

# Alias `wget` to itself but keeping wget-hsts somewhere else
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'

# Let's not cd ../../../ all the way up
# (I use zoxide, btw)
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# Alias `ls` to `exa` if it exists on path
if [[ -x $(command -v exa) ]]; then
  alias ls="exa"
  alias ll="exa -l"
  alias la="exa -la --octal-permissions --icons"
fi

# Alias `vim` and `v` to `nvim` if it exists on path
if [[ -x $(command -v nvim) ]]; then
  alias v="nvim"
fi

# Alias `cat` to `bat` if it exists on path
[[ -x $(command -v bat) ]] && alias cat="bat"

# Load command-not-found plugin
[[ -r ${ZDOTDIR}/plugins/command-not-found/command-not-found.plugin.zsh ]] && \
  . ${ZDOTDIR}/plugins/command-not-found/command-not-found.plugin.zsh

# Load zsh-autosuggestions plugin 
if [[ -r ${ZDOTDIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh ]]; then
  . ${ZDOTDIR}/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
  declare -x ZSH_AUTOSUGGEST_STRATEGY=(history completion)
  declare -i ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
  declare -x ZSH_AUTOSUGGEST_USE_ASYNC=true
fi

# Load zsh-autopair plugin
[[ -r ${ZDOTDIR}/plugins/zsh-autopair/autopair.plugin.zsh ]] && \
  . ${ZDOTDIR}/plugins/zsh-autopair/zsh-autopair.plugin.zsh

# Initialize zoxide (cd replacement)
[[ -x $(command -v zoxide) ]] && eval "$(zoxide init zsh)"

# Initialize fnm (Fast Node Manager)
[[ -d ${XDG_DATA_HOME}/fnm ]] && PATH="${XDG_DATA_HOME}/fnm:$PATH"
[[ -x $(command -v fnm) ]] && eval "$(fnm env --use-on-cd)"

# Add cargo/bin to $PATH
[[ -d ${XDG_DATA_HOME}/cargo/bin ]] && PATH="${XDG_DATA_HOME}/cargo/bin:$PATH"

# Add go/bin to $PATH
[[ -d ${XDG_DATA_HOME}/go/bin ]] && PATH="${XDG_DATA_HOME}/go/bin:$PATH"

# Load zsh-syntax-highlighting plugin
if [[ -r ${ZDOTDIR}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]]; then
    declare -a ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern regexp)
    . ${ZDOTDIR}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fi

[[ -r ${ZDOTDIR}/plugins/powerlevel10k/powerlevel10k.zsh-theme ]] && \
    . ${ZDOTDIR}/plugins/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

