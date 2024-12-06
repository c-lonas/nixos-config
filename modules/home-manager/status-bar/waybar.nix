{ config, lib, pkgs, ... }:

let
  waybarConfig = ''
    {
      "layer": "top",
      "modules-left": ["sway/workspaces", "sway/mode", "tray", "sway/taskbar"],
      "modules-center": ["sway/window"],
      "modules-right": ["cpu", "memory", "disk", "network", "battery", "clock"],
      "sway/window": {
        "max-length": 50
      },
      "battery": {
        "format": "{capacity}% {icon}",
        "format-icons": ["", "", "", "", ""]
      },
      "clock": {
        "format-alt": "{:%a, %d. %b  %H:%M}"
      },
      "cpu": {
        "format": "CPU {usage}%"
      },
      "disk": {
        "format": "DISK {percentage_used}%"
      },
      "memory": {
        "format": "MEM {percentage}%"
      },
    }
  '';



  
in {

  home.packages = with pkgs; [ waybar ];

  programs.waybar.enable = true;

  home.file = {
    ".config/waybar/config" = {
      text = waybarConfig;
    };
    # ".config/waybar/style.css" = {
    #   text = waybarStyle;
    # };
  };


}
