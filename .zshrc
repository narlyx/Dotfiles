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
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
export MANPAGER="sh -c 'col -bx | bat -l man'"
export MANROFFOPT="-c"

alias fetch="nitch"
alias top="btop"

# Shortcuts
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

# Prompt
nitch
PROMPT="%F{green}%n@%m %F{blue}%~ %F{white}> "
RPROMPT="%F{green}%t"
