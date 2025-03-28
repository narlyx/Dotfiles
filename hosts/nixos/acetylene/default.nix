{pkgs, ...}: {
  # Imports section
  imports = [
    ./hardware-configuration.nix
    ../common/system
    ../common/users
    ../common/environments/plasma.nix
    ../common/features/tailscale.nix
    ../common/features/virtualisation.nix
    ../common/features/flatpak.nix
    ../common/features/docker.nix
  ];
  home-manager.users."narlyx".imports = [../../../home/narlyx/nixos];

  # Host name
  networking.hostName = "acetylene";

  # Special networking
  networking = {
    interfaces = {
      enp5s0.useDHCP = true;
      br0.useDHCP = true;
    };
    bridges = {
      "br0" = {
        interfaces = ["enp5s0"];
      };
    };
  };

  # Packages
  environment.systemPackages = with pkgs; [
    looking-glass-client
    pciutils
  ];

  # GPU passthough
  systemd.tmpfiles.rules = [
    "f /dev/shm/scream 0660 narlyx qemu-libvirtd -"
    "f /dev/shm/looking-glass 0660 narlyx qemu-libvirtd -"
  ];

  boot = {
    kernelParams = ["kvm-amd" "amd_iommu=on"];
    kernelModules = ["vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio"];
    postBootCommands = ''
      HOSTDEVS="0000:0b:00.0 0000:0b:00.1"
      VFIODEVS="0000:0e:00.0 0000:0e:00.1"

      for DEV in $HOSTDEVS; do
        echo "amdgpu" > /sys/bus/pci/devices/$DEV/driver_override
      done

      for DEV in $VFIODEVS; do
        echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
      done
      modprobe -i vfio-pci
    '';
  };

  # System version
  system.stateVersion = "24.11";
}
