# Plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light MichaelAquilina/zsh-auto-notify
zinit light MichaelAquilina/zsh-you-should-use

# Snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo

# Shell integrations
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(thefuck --alias)"
if [[ -f "/opt/homebrew/bin/brew" ]] then # Homebrew
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Tmux autolaunch
if [[ -n $DISPLAY && -n $XDG_CURRENT_DESKTOP ]] || [[ "$(uname)" == "Darwin" ]]; then
  if [[ -z "$TMUX" && "$TERM" == "alacritty" ]]; then
    tmux attach-session -t $(tmux ls | awk '{print $1}' | tail -n 1) 2>/dev/null || tmux new-session
  fi
fi

# Shell variables
export MANPAGER="sh -c 'col -bx | bat -l man'"
export MANROFFOPT="-c"

# Aliases
alias cls="clear" # Muscle memory
alias vim="nvim"
alias cd="z" # Unix tool replacements
alias ls="eza --oneline --icons --git"
alias ll="eza -lah --icons --git"
alias tree="eza --tree --icons --ignore-glob='.git'"
alias du="du -h --max-depth=1"
alias cat="bat"
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'" # Fancy fzf
alias pbcopy="xsel --input --clipboard" # Clipboard
alias pbpaste="xsel --output --clipboard"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg" # Grub
alias update-grub2="sudo grub2-mkconfig -o /boot/grub2/grub.cf"

# General unix only
if [[ "$(uname)" != "darwin" ]]; then
  alias rm="rmtrash" # trash
  alias rmdir="rmdirtrash"
  export GH_PATH="/usr/bin/gh" # gh path
fi

# MacOS only
if [[ "$(uname)" == "darwin" ]]; then
  export GH_PATH="/opt/homebrew/bin/gh" # gh path
fi

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completions
autoload -Uz compinit && compinit
zinit cdreplay -q

# Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
