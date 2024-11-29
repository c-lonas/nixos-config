{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix   
    ../../users.nix
    ../../modules/base-system.nix
    ../../modules/dewm/gnome.nix
  ];

  options = {
    hostSystemProfile = lib.mkOption {
      type = lib.types.enum ["minimal" "lightweight" "full"];
      default = "minimal";
      description = "Determines which home packages are installed | Options: minimal, lightweight, full";
    };
  };

  # Need to specify the top level config block explicitly 
  # if the configuration file also has the options block.
  config = {
    # Hostname definition
    networking.hostName = "south-ponto"; 

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

    # Copy the NixOS configuration file and link it from the resulting system
    # (/run/current-system/configuration.nix). This is useful in case you
    # accidentally delete configuration.nix.
    # system.copySystemConfiguration = true;

    # This option defines the first version of NixOS you have installed on this particular machine,
    # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
    system.stateVersion = "24.05"; # Don't change: see man configuration.nix, or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
  };
}

