{
  description = "Basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations = {

      ############## south-ponto ###############
      south-ponto = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/south-ponto/configuration.nix
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
        ];
      };


      ############## north-ponto ###############
      north-ponto = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./hosts/north-ponto/configuration.nix
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
        ];
      };



    };
  };
}
