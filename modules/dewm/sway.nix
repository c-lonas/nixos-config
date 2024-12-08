{ config, pkgs, ... }:

{


  # Enable sway
  programs.sway.enable = true; 

  # Display manager configuration
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  # services.displayManager.defaultSession = "sway"; # This option can be used if programs.sway.enable = true;

  # This might be necessary?
  security.polkit.enable = true;

  # System packages for Sway
  environment.systemPackages = with pkgs; [
    sddm
    sway
  ];

  # For vscode on wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

}
