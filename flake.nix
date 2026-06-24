{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
		# Core modules
			./modules/hardware-configuration.nix
			./modules/configuration.nix
		
		# Packages list
			./modules/packages.nix
		
		# Desktop and shell config
			./modules/gnome.nix
			./modules/zsh.nix
        ];
      };
    };
  };
}
