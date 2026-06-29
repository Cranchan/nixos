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
<<<<<<< HEAD
      user.Name = user;
      user.Email = email;
=======
      settings.user.Name = user;
      settings.user.Email = email;
>>>>>>> fc39591 (fixed deprecated git user and email definitions)
    };

    programs.home-manager.enable = true;
  };
}
