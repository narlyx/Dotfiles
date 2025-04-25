# Status text
echo "Loading zsh..."

# Zim configuration
ZIM_CONFIG_FILE=~/.zimrc
ZIM_HOME=~/.zim

# Download Zim if needed
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
    https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
fi

# Zim auto updates
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi

# Loading Zim modules
source ${ZIM_HOME}/init.zsh

# Zoxide
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(thefuck --alias)"

# History options
HISTSIZE="5000"
savehist="5000"
histfile="~/.zsh_history"
mkdir -p "$(dirname $HISTFILE)"
setopt HIST_FCNTL_LOCK
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
unsetopt HIST_SAVE_NO_DUPS
unsetopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
unsetopt HIST_EXPIRE_DUPS_FIRST
setopt SHARE_HISTORY
unsetopt EXTENDED_HISTORY

# Aliases
alias reload='source ~/.zshrc'
alias cd=z
alias cat=bat
alias cls=clear
alias l='eza --oneline --icons --git'
alias la='eza --oneline -ah --icons --git'
alias ll='eza -lah --icons --git'
alias ls='eza --oneline --icons --git'
alias tree='eza --tree --icons --ignore-glob=.git'

