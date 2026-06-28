{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/t14/hardware-configuration.nix
          ./hosts/t14/configuration.nix
          ./modules/packages.nix
          ./modules/zsh.nix
          ./modules/fastfetch.nix
          ./modules/gnome.nix
          
          home-manager.nixosModules.home-manager
          {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.cranchan = import ./home.nix;
          }
        ];
      };
    };
  };
}
