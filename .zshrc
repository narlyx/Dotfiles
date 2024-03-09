eval "$(zoxide init zsh)"
eval "$(thefuck --alias)"

alias cd="z"
alias ls="eza"
alias ll="eza -lah"
alias tree="eza --tree --ignore-glob='.git'"
alias cat="bat"

alias python="python3"

PROMPT="%F{green}%n@%m %F{blue}%~ %F{white}> "
RPROMPT="%F{green}%t"

if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX
fi
if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
  tmux attach-session -t ssh_tmux || tmux new-session -s ssh_tmux
fi
