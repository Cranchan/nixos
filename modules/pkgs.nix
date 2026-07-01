{ pkgs, user, email, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # CLI Tools
    micro
    btop
    curl
    wget
    git
    tmux
    catimg

    # GUI System Apps (GNOME)
    ptyxis
    nautilus
    gnome-tweaks
    gedit

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
    gnomeExtensions.caffeine
  ];

  home-manager.users.${user} = {
    home.username = user;
    home.homeDirectory = "/home/${user}";
    home.stateVersion = "26.05";

    programs.git = {
      enable = true;

      # Home Manager standard shortcuts (cleaner and native)
      settings.user.Name = user;
      settings.user.Email = email;

      # Extra raw git config options go here cleanly
      settings = {
        init.defaultBranch = "main"; 
      };
    };

    programs.home-manager.enable = true;
  };
}
