# https://github.com/narlyx/dotnix
{pkgs, ...}: {
  # Packages
  environment.systemPackages = with pkgs; [
    # --- USED TO SETUP ---
    stow

    # --- Shell ---
    # Zsh
    zsh
    zoxide
    eza
    bat
    thefuck

    # Prompt
    starship

    # Git
    git
    delta
    gh

    # Neofetch
    neofetch
    imagemagick
    viu

    # Utilities
    tmux

    # --- DESKTOP ENVIRONMENT ---
    playerctl
    brightnessctl
    swww
    grim
    slurp
    swappy
    jq

    # --- COMMON APPLICATIONS ---
    # Web
    librewolf

    # Terminal
    ghostty

    # Media
    spotify

    # Communication
    vesktop

    # Office
    obsidian
    onlyoffice-desktopeditors
    zoom-us

    # Utilities
    qbittorrent

    # --- DEVELOPMENT ---
    # Python
    python314
    (pkgs.python314.withPackages (p:
      with p; [
        pip
        build
        requests
        tkinter
        typer
        numpy
        matplotlib
        pandas
      ]))
  ];

  # Desktop environment
  programs.hyprland.enable = true;
}
