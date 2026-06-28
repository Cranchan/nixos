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
			./modules/hosts/t14/hardware-configuration.nix
			./modules/hosts/t14/configuration.nix
			./modules/packages.nix
			./modules/zsh.nix
			./modules/fastfetch.nix
			./modules/gnome.nix

        ];
      };
    };
  };
}
