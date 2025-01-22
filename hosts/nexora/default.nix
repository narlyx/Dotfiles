{ inputs, outputs, config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common/fonts/nerdfonts.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = true;
  };

  time.timeZone = "America/Boise";
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  users.users.narlyx = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
  ];

  services = {
    openssh.enable = true;
    tailscale.enable = true;
  };

  networking.hostName = "nexora";
  networking.networkmanager.enable = true;
  
  system.stateVersion = "24.11";
}
