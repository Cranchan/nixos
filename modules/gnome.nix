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
          pkgs.gnomeExtensions.caffeine.extensionUuid
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
