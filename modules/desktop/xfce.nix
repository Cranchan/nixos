{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  environment.xfce.excludePackages = with pkgs; [ ];

  environment.systemPackages = with pkgs; [
    xfce.thunar             
    xfce.xfce4-terminal     
    xfce.mousepad           
    xfce.ristretto          
    xfce.xfce4-pulseaudio-plugin 
    xfce.xfce4-whiskermenu-plugin 
    greybird                
    papirus-icon-theme      
    nerd-fonts.jetbrains-mono
  ];
}
