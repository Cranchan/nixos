{ pkgs, ... }: {
  home.username = "cranchan";
  home.homeDirectory = "/home/cranchan";

  # Do not change this value unless you have read the changelog of a newer version.
  # It controls state version compatibility.
  home.stateVersion = "26.05"; 

  home.packages = with pkgs; [
  
  ];

  programs.git.settings = {
    enable = true;
    user.name = "cranchan";
    user.email = "klusignolo54@gmail.com";
  };
  
  programs.home-manager.enable = true;
}
