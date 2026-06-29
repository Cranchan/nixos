{ pkgs, user, email, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    micro
    btop
    curl
    wget
    git
    tmux
    catimg
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
