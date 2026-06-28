{ config, pkgs, ... }:

{
  # Allow unfree packages (like Steam, Discord, VS Code)
  nixpkgs.config.allowUnfree = true;

  # System-wide packages available to all users
  environment.systemPackages = with pkgs; [
   
    # CLI applications
    micro
    helix
    btop
    curl
    wget
    git
    tmux
	catimg

	# Silly programs
    cowsay
    lolcat
    asciiquarium
    cmatrix
    
    # Container software
    distrobox

    # General software
    spotify
    vesktop

    # Gaming & Windows
    wine
    dosbox
    
  ];

  # Steam configuration
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; 
    dedicatedServer.openFirewall = true; 
    localNetworkGameTransfers.openFirewall = true; 
  	};
  	
  	# Enable containers
		virtualisation.containers.enable = true;
		virtualisation.podman = {
		enable = true;
		dockerCompat = true;
		};
		
	#Firefox
	programs.firefox.enable = true;
}
