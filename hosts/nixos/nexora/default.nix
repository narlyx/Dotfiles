{...}: {
  # Imports section
  imports = [
    ./hardware-configuration.nix
    ../common/system
    ../common/users
    ../common/environments/hyprland.nix
    ../common/features/tailscale.nix
    ../common/features/printing.nix
  ];
  home-manager.users."narlyx".imports = [../../../home/narlyx/nixos];

  # Host name
  networking.hostName = "nexora";

  # Touchpad fix
  environment.etc."modprobe.d/psmouse.conf".text = ''
    options psmouse synaptics_intertouch=1
  '';
  # If mouse stops working: sudo rmmod psmouse && modprobe psmouse

  # System version
  system.stateVersion = "24.11";
}
