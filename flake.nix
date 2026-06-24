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
			./modules/hardware-configuration.nix
			./modules/configuration.nix
			./modules/packages.nix

			# enable for gnome desktop
			./modules/desktop/gnome.nix

			# enable for xfce desktop
			#./modules/desktop/xfce.nix
			./modules/zsh.nix
			./modules/fastfetch.nix
        ];
      };
    };
  };
}
