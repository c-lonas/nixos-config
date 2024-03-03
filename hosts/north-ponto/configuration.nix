{ config, pkgs, lib, inputs, ... }:

let 
  hostname = "north-ponto";
in 
{ imports =
    [
      ./hardware-configuration.nix
      ../../modules/system.nix
      ../../modules/packages.nix
      inputs.home-manager.nixosModules.default
    ];

  # Define Hostname
  networking.hostName = "${hostname}";

  # Enable hyprland
  programs.hyprland.enable = true;

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true; services.xserver.desktopManager.gnome.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.battery = { isNormalUser = true; description = "Chase Lonas"; extraGroups = [ "networkmanager" "wheel" ]; 
  };

  home-manager = {
    users = {
      "battery" = import ./home.nix;
    };
  };

  

  
}
