{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs = { self, nixpkgs, home-manager, nix-flatpak, ... }@inputs:
    let
      user = "cranchan";
      email = "klusignolo54@gmail.com";
    in
    {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit user email; };
        modules = [
          ./hosts/t14/hardware-configuration.nix
          ./hosts/t14/configuration.nix
          ./modules/pkgs.nix
          ./modules/shell.nix
          ./modules/gnome.nix
          ./modules/gaming.nix
          ./modules/virtualization.nix
          ./modules/flatpak.nix
          
          nix-flatpak.nixosModules.nix-flatpak
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.extraSpecialArgs = { inherit user email; };
          }
        ];
      };
    };
  };
}
