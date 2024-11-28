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

  config = {

  
    # Hostname definition
    networking.hostName = "north-ponto"; 

    # Set hostSystemProfile option
    hostSystemProfile = "lightweight";

   # Expose hostSystemProfile as an environment variable
    environment.sessionVariables.HOST_SYSTEM_PROFILE = config.hostSystemProfile; # Troubleshoot this later. PAM? 
    
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
      useDHCP = false;
      interfaces.wlp61s0.ipv4.addresses = [{
        address = "192.168.1.7";
        prefixLength = 24;
      }];
      defaultGateway = {
        address = "192.168.1.1";
        interface = "wlp61s0";
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


