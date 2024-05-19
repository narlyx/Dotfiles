# Evals
eval "$(zoxide init zsh)"
eval "$(thefuck --alias)"

# Unix CLI replacements
alias cd="z"
alias ls="eza -lh"
alias ll="eza -lah"
alias tree="eza --tree --ignore-glob='.git'"
alias du="du -h --max-depth=1"
alias cat="bat"

# Fzf Shortcut
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

# Man modified to use bat
export MANPAGER="sh -c 'col -bx | bat -l man'"
export MANROFFOPT="-c"

# Clipboard Shortcuts
alias pbcopy="xsel --input --clipboard"
alias pbpaste="xsel --output --clipboard"

# Showoff Shortcuts
alias fetch="nitch"
alias top="btop"

# Grub Shortcuts
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias update-grub2="sudo grub2-mkconfig -o /boot/grub2/grub.cf"

# Prompt
fetch
PROMPT="%F{green}%n@%m %F{blue}%~ %F{white}> "
RPROMPT="%F{green}%t"
