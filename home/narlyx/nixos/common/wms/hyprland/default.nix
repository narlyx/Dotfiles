{
  inputs,
  pkgs,
  ...
}: {
  # Imports
  imports = [
    inputs.ags.homeManagerModules.default
    ./hypr.nix
  ];

  # Packages
  home.packages = with pkgs; [
    playerctl
    brightnessctl
    swww
    walker
    gtk3
    gtk4
  ];

  # Hyprland configuration
  wayland.windowManager.hyprland = {
    # Enabling hyprland for home-manager
    enable = true;
  };

  # AGS configuration
  programs.ags = {
    enable = true;
    configDir = ./ags;
    extraPackages = with pkgs; [
      inputs.ags.packages.${pkgs.system}.hyprland
      inputs.ags.packages.${pkgs.system}.tray
    ];
  };
}
