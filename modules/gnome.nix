{ config, pkgs, ... }:

{
  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  
  # Disable gnome core applications so only needed applications will be added as defined below in system package
  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  
  environment.gnome.excludePackages = with pkgs; [ 
    gnome-tour 
    gnome-user-docs 
    xterm
  ];


environment.systemPackages = with pkgs; [
  
    # Gnome Software
    ptyxis
    nautilus
    rewaita
    gnome-tweaks
    gedit    
    
    # Icons
    papirus-icon-theme

    # Fonts
    nerd-fonts.adwaita-mono
    
    # Gnome extensions
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.middle-click-to-close-in-overview
    gnomeExtensions.user-themes  
  ];
}
