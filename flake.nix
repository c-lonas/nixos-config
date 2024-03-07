{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-colors.url = "github:misterio77/nix-colors";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    
      nixosConfigurations = {
        north-ponto = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            };
          modules = [ 
            ./hosts/north-ponto/configuration.nix
            home-manager.nixosModules.home-manager {
              home-manager.extraSpecialArgs = { 
                inherit inputs; 
                inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) gtkThemeFromScheme;
                };
            }

          ];
        };
      };

    };
}
