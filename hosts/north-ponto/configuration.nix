{ config, lib, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ../../users.nix
      ../../modules/base-system.nix
      ../../modules/dewm/kde-plasma.nix
  ];

  options = {
    hostSystemProfile = lib.mkOption {
      type = lib.types.enum ["minimal" "lightweight" "full"];
      default = "minimal";
      description = "Determines which home packages are installed | Options: minimal, lightweight, full";
    };
  };

  config = {

    # Hostname definition
    networking.hostName = "north-ponto"; 

    # Set hostSystemProfile option
    hostSystemProfile = "lightweight";

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    
    home-manager.users = {
      admin = import ../../home/admin.nix {
        inherit config pkgs;
        hostSystemProfile = config.hostSystemProfile; 
      };

      chase = import ../../home/chase.nix {
        inherit config pkgs;
        hostSystemProfile = config.hostSystemProfile; 
      };
    };

    networking.networkmanager.enable = true;

    # This option defines the first version of NixOS you have installed on this particular machine,
    # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
    system.stateVersion = "24.05"; # Don't change: see man configuration.nix, or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
  };
}


