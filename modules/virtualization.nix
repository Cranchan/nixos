{ pkgs, user, ... }:

{
  # Podman & Containers
  virtualisation.containers.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  # KVM / QEMU / Libvirt
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.${user}.extraGroups = [ "libvirtd" ];

  environment.systemPackages = with pkgs; [
    distrobox
    gnome-boxes
  ];
}
