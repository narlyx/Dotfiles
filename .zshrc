eval "$(zoxide init zsh)"
eval "$(thefuck --alias)"

alias cd="z"
alias ls="eza -lh"
alias ll="eza -lah"
alias tree="eza --tree --ignore-glob='.git'"
alias du="du -h --max-depth=1"
alias cat="bat"
alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias python="python3"

PROMPT="%F{green}%n@%m %F{blue}%~ %F{white}> "
RPROMPT="%F{green}%t"
