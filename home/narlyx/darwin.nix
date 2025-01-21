{ inputs, pkgs, ... }:

{
  imports = [
    ./features/cli
    ./features/desktop/darwin
  ];

  nixpkgs = {
    overlays = [
      inputs.brew-nix.overlays.default
    ];
  };

  home = {
    username = "narlyx";
    homeDirectory = "/Users/narlyx";

    packages = with pkgs; [
      nodejs
      jdk11
      #gradle
      android-tools
      brewCasks.android-studio
    ];

    stateVersion = "24.11";
  };

  programs.home-manager.enable = true;
}
