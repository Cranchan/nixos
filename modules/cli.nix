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
      userName = user;
      userEmail = email;
    };

    programs.home-manager.enable = true;
  };
}
