{ config, pkgs, user, ... }:

{
  # --- System-Level GNOME Core Settings ---
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  
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
    gnome-text-editor       
    
    # Icons
    papirus-icon-theme
    adwaita-icon-theme

    # Fonts
    nerd-fonts.adwaita-mono
    
    # Gnome extensions
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.middle-click-to-close-in-overview
    gnomeExtensions.user-themes  
  ];

  # --- User-Level Home Manager Settings ---
  home-manager.users.${user} = { ... }: {
    dconf.settings = {
      # 1. Background Wallpapers
      "org/gnome/desktop/background" = {
        picture-uri = "file://${../assets/catpuccin-nix.jpg}";
        picture-uri-dark = "file://${../assets/catpuccin-nix.jpg}";
        picture-options = "stretched";
      };
      "org/gnome/desktop/screensaver" = {
        picture-uri = "file://${../assets/catpuccin-nix.jpg}";
      };

      # 2. Extensions
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          pkgs.gnomeExtensions.user-themes.extensionUuid
          pkgs.gnomeExtensions.dash-to-dock.extensionUuid
          pkgs.gnomeExtensions.blur-my-shell.extensionUuid
          pkgs.gnomeExtensions.middle-click-to-close-in-overview.extensionUuid
        ];
      };

      # 3. Shell Theme
      "org/gnome/shell/extensions/user-theme" = {
        name = "Rewaita";
      };
    };

    # 4. Application Theme (GTK & Icons)
    gtk = {
      enable = true;
      theme = {
        name = "Rewaita"; 
      };
      iconTheme = {
        name = "Papirus-Dark";
      };
    };
  };
}
