{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";

  # Enable KDE Plasma desktop environment
  services.xserver.desktopManager.plasma5.enable = true;
  services.displayManager.defaultSession = "plasma";


  # Example system packages
  environment.systemPackages = with pkgs; [
    lolcat
  ];

}
