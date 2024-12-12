# Evals
eval "$(starship init zsh)"
#eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/config.toml)"
eval "$(zoxide init zsh)"
eval "$(thefuck --alias)"

# Tmux autolaunch
if [[ -n $DISPLAY && -n $XDG_CURRENT_DESKTOP ]] || [[ "$(uname)" == "Darwin" ]]; then
  if [[ -z "$TMUX" && "$TERM" == "alacritty" ]]; then
    tmux attach-session -t $(tmux ls | awk '{print $1}' | tail -n 1) 2>/dev/null || tmux new-session
  fi
fi

# Unix CLI replacements
alias cd="z"
alias ls="eza --oneline --icons --git"
alias ll="eza -lah --icons --git"
alias tree="eza --tree --icons --ignore-glob='.git'"
alias du="du -h --max-depth=1"
alias cat="bat"

# Will not run on macos
if [[ "$(uname)" != "Darwin" ]]; then
  alias rm="rmtrash"
  alias rmdir="rmdirtrash"
  export GH_PATH="/usr/bin/gh"
fi

# Will run on macos
if [[ "$(uname)" == "Darwin" ]]; then
  export GH_PATH="/opt/homebrew/bin/gh"
fi

# Git shortcuts
alias gs="git status"
alias gd="git diff origin/master | cat"

# Fzf shortcut
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

# Man modified to use bat
export MANPAGER="sh -c 'col -bx | bat -l man'"
export MANROFFOPT="-c"

# Clipboard shortcuts
alias pbcopy="xsel --input --clipboard"
alias pbpaste="xsel --output --clipboard"

# Grub shortcuts
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias update-grub2="sudo grub2-mkconfig -o /boot/grub2/grub.cf"

# Windows muscle memory
alias cls="clear"
