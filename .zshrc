if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  unset __ETC_PROFILE_NIX_SOURCED
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

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
