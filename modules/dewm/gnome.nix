{ config, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";

  # Enable GNOME desktop environment
  services.xserver.desktopManager.gnome.enable = true;
  services.displayManager.defaultSession = "gnome";
}
