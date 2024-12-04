{ config, lib, pkgs, ... }:

let
  hostname = "north-ponto";
  hostOptions = import ../host-options.nix;
  currentHostOptions = hostOptions.${hostname};
  dewmModule = ../../modules/dewm/${currentHostOptions.dewm}.nix;
  dewmHomeModule = ../../modules/home-manager/home-dewm/${currentHostOptions.dewm}.nix;
in
{
  imports = [
      ./hardware-configuration.nix
      ../../users.nix
      ../../modules/base-system.nix
      dewmModule
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
    hostSystemProfile = currentHostOptions.hostSystemProfile;

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    
    home-manager.users = {
      admin = import ../../home/admin.nix {
        inherit config pkgs;
        hostSystemProfile = config.hostSystemProfile; 
        dewmHomeModule = dewmHomeModule;
      };

      chase = import ../../home/chase.nix {
        inherit config pkgs;
        hostSystemProfile = config.hostSystemProfile; 
        dewmHomeModule = dewmHomeModule;
      };
    };

    networking.networkmanager.enable = true;

    # This option defines the first version of NixOS you have installed on this particular machine,
    # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
    system.stateVersion = "24.05"; # Don't change: see man configuration.nix, or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
  };
}


