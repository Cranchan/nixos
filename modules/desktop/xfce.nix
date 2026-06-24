{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  environment.xfce.excludePackages = with pkgs; [ ];

  environment.systemPackages = with pkgs; [
    thunar             
    xfce4-terminal     
    mousepad           
    ristretto          
    xfce4-pulseaudio-plugin 
    xfce4-whiskermenu-plugin 
    greybird                
    papirus-icon-theme      
    nerd-fonts.jetbrains-mono
    nerd-fonts.adwaita-mono
  ];
}
