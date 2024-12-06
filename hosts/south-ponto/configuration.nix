{ config, lib, pkgs, inputs, ... }:


let
  hostname = "south-ponto";
  userOptions = import ../../home/user-options.nix;
  hostOptions = import ../host-options.nix;
  currentHostOptions = hostOptions.${hostname};
  dewmModule = ../../modules/dewm/${currentHostOptions.dewm}.nix;
  dewmHomeModule = ../../modules/home-manager/home-dewm/${currentHostOptions.dewm}.nix;
in
{
  imports = [
    ./hardware-configuration.nix
    ./gaming.nix
    ../../modules/users.nix
    ../../modules/base-system.nix
    ../../modules/theming/stylix.nix
    dewmModule
  ];

  options = {
    hostSystemProfile = lib.mkOption {
      type = lib.types.enum ["minimal" "lightweight" "full"];
      default = "minimal";
      description = "Sets which group of home packages are installed | Options: minimal, lightweight, full";
    };

  };

  # Need to specify the top level config block explicitly 
  # if the configuration file also has the options block.
  config = {

    # Hostname definition
    networking.hostName = hostname; 

    # Set hostSystemProfile option
    hostSystemProfile = currentHostOptions.hostSystemProfile;

    home-manager.users = {
      admin = import ../../home/users/admin.nix {
        inherit inputs config pkgs;
        hostSystemProfile = config.hostSystemProfile;
        dewmHomeModule = dewmHomeModule;
        base16ThemeChoice = userOptions.admin.base16-theme;
      };

      chase = import ../../home/users/chase.nix {
        inherit inputs config pkgs;
        hostSystemProfile = config.hostSystemProfile;
        dewmHomeModule = dewmHomeModule;
        base16ThemeChoice = userOptions.chase.base16-theme;
      };
    };



    networking.networkmanager.enable = true;

    # This option defines the first version of NixOS you have installed on this particular machine,
    # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
    system.stateVersion = "24.05"; # Don't change: see man configuration.nix, or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
  };
}

