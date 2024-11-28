{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/base-system.nix
    ../../users.nix
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


    networking = {
      networkmanager.enable = true;
      interfaces.wlp0s20f3.ipv4.addresses = [{
        address = "192.168.1.6";
        prefixLength = 24;
      }];
      defaultGateway = {
        address = "192.168.1.1";
        interface = "wlp0s20f3";
      };
    }; 

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Configure keymap in X11
    services.xserver.xkb.layout = "us";

    # Enable XFCE desktop environment to start with
    services.xserver.desktopManager.xfce.enable = true;
    services.displayManager.defaultSession = "xfce";

    # Enable picom 
    services.picom = {
      enable = true;
      fade = true;
      inactiveOpacity = 0.9;
      shadow = true;
      fadeDelta = 4;
    };



    # Copy the NixOS configuration file and link it from the resulting system
    # (/run/current-system/configuration.nix). This is useful in case you
    # accidentally delete configuration.nix.
    # system.copySystemConfiguration = true;

    # This option defines the first version of NixOS you have installed on this particular machine,
    # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
    system.stateVersion = "24.05"; # Don't change: see man configuration.nix, or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
  };
}

