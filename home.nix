{ pkgs, ... }: {
  home.username = "cranchan";
  home.homeDirectory = "/home/cranchan";

  # Do not change this value unless you have read the changelog of a newer version.
  # It controls state version compatibility.
  home.stateVersion = "24.11";
	
	imports = [
  	./modules/fastfetch.nix
  ];
    
  programs.git = {
    enable = true;
    userName = "cranchan";
    userEmail = "klusignolo54@gmail.com";
  };
  
  programs.home-manager.enable = true;
}
