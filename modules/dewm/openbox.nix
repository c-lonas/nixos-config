{ config, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";

  # Enable Openbox window manager
  services.xserver.windowManager.openbox.enable = true;
  services.displayManager.defaultSession = "none+openbox";

  # Optional: Add a compositor for effects
  # Enable picom 
  services.picom = {
    enable = true;
    fade = true;
    inactiveOpacity = 0.9;
    shadow = true;
    fadeDelta = 4;
  };
}
