{ pkgs, config, lib, ... }:

let 
    palette = config.colorScheme.palette;

in with lib;
{
    programs.waybar = {
        enable = true;
        package = pkgs.waybar;
        settings = [{
            layer = "top";
            position = "top";

            modules-left = [ "cpu" "memory" ];
            modules-right = [ "battery" "clock" ];

            "clock" = {
                format = if clock24h == true then ''{: %H:%M}'' 
                else ''{: %I:%M %p}'';
                    tooltip = true;
                tooltip-format = "<big>{:%A, %d.%B %Y }</big><tt><small>{calendar}</small></tt>";
            };
            "memory" = {
                interval = 5;
                format = " {}%";
                tooltip = true;
            };
            "cpu" = {
                interval = 5;
                format = " {usage:2}%";
                tooltip = true;
            };
            "battery" = {
                states = {
                warning = 30;
                critical = 15;
                };
                format = "{icon} {capacity}%";
                format-charging = "󰂄 {capacity}%";
                format-plugged = "󱘖 {capacity}%";
                format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
                on-click = "";
                tooltip = false;
            };



        }]
    }
}