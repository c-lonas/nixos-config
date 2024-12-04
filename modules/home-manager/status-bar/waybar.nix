{ config, lib, pkgs, ... }:

let
  waybarConfig = ''
    {
      "height": 30,
      "layer": "top",
      "position": "top",
      "modules-left": ["network", "cpu", "memory"],
      "modules-right": ["clock", "tray"]
    }
  '';
  waybarStyle = ''
    * {
      font-family: "Sans";
      color: #ffffff;
    }
    .clock {
      color: #ffcc00;
    }
  '';
in {

  home.packages = with pkgs; [
    waybar
  ];

  programs.waybar.enable = true;

  home.file = {
    ".config/waybar/config" = {
      text = waybarConfig;
    };
    ".config/waybar/style.css" = {
      text = waybarStyle;
    };
  };


}
