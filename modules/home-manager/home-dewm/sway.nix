{ config, pkgs, ... }:

{

  imports = [
    ../status-bar/waybar.nix
    ../terminal/kitty.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "kitty"; 
      bars = []; # disable swaybar
      startup = [
        {command = "waybar";}
      ];
    };
  };

}