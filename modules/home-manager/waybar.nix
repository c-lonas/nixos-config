{ pkgs, config, lib, ... }:

let 
    palette = config.colorScheme.palette;
    betterTransition = "all 0.3s cubic-bezier(.55,-0.68,.48,1.682)";

in with lib;
{
    programs.waybar = {
        enable = true;
        package = pkgs.waybar;
        settings = [{
            layer = "top";
            position = "top";

            modules-center = [ "hyprland/workspaces" ] ;
            modules-left = [ "custom/startmenu" "hyprland/window" "pulseaudio" "cpu" "memory" ];
            modules-right = [ "battery" "network" "clock" "tray" "custom/exit" "idle_inhibitor" ];


            "hyprland/workspaces" = {
                format = "{icon}"; # "{name}";
                format-icons = {
                    default = " ";
                    active = " ";
                    urgent = " ";
                };
                on-scroll-up = "hyprctl dispatch workspace e+1";
                on-scroll-down = "hyprctl dispatch workspace e-1";
            };
            "hyprland/window" = {
                max-length = 25;
                separate-outputs = false;
            };


            "clock" = {
                format = ''{: %I:%M %p}'';
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
            "disk" = {
                format = " {free}";
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
            "network" = {
                format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
                format-ethernet = " {bandwidthDownOctets}";
                format-wifi = "{icon} {signalStrength}%";
                format-disconnected = "󰤮";
                tooltip = false;
            };
            "pulseaudio" = {
                format = "{icon} {volume}% {format_source}";
                format-bluetooth = "{volume}% {icon} {format_source}";
                format-bluetooth-muted = " {icon} {format_source}";
                format-muted = " {format_source}";
                format-source = " {volume}%";
                format-source-muted = "";
                format-icons = {
                headphone = "";
                hands-free = "";
                headset = "";
                phone = "";
                portable = "";
                car = "";
                default = ["" "" ""];
                };
                on-click = "sleep 0.1 && pavucontrol";
            };
            "tray" = {
                spacing = 12;
            };
            "custom/exit" = {
                tooltip = false;
                format = "";
                on-click = "sleep 0.1 && wlogout";
            };
            "custom/startmenu" = {
                tooltip = false;
                format = " ";
                on-click = "sleep 0.1 && wofi";
            };

            "idle_inhibitor" = {
                format = "{icon}";
                format-icons = {
                    activated = "";
                    deactivated = "";
                };
                tooltip = "true";
            };

        }];
        style = concatStrings [''
            * {	
                font-size: 16px;	
                font-family: JetBrainsMono Nerd Font, Font Awesome, sans-serif;
                font-weight: bold;      
            }      
            window#waybar {	
                background-color: rgba(26,27,38,0);	border-bottom: 1px solid rgba(26,27,38,0);	border-radius: 0px;	color: #${palette.base0F};     
            }      
            #workspaces {	background: #${palette.base00};	margin: 5px;	padding: 0px 1px;	border-radius: 15px;	border: 0px;	font-style: normal;	color: #${palette.base00};      }      
            #workspaces button {	padding: 0px 5px;	margin: 4px 3px;	border-radius: 15px;	border: 0px;	color: #${palette.base00};	background: linear-gradient(45deg, #${palette.base0C}, #${palette.base0D}, #${palette.base0E});	opacity: 0.5;	transition: ${betterTransition};      }      
            #workspaces button.active {	padding: 0px 5px;	margin: 4px 3px;	border-radius: 15px;	border: 0px;	color: #${palette.base00};	background: linear-gradient(45deg, #${palette.base0D}, #${palette.base0E});	opacity: 1.0;	min-width: 40px;	transition: ${betterTransition};      }      
            #workspaces button:hover {	border-radius: 15px;	color: #${palette.base00};	background: linear-gradient(45deg, #${palette.base0D}, #${palette.base0E});	opacity: 0.8;	transition: ${betterTransition};      }      @keyframes gradient_horizontal {	0% {	  background-position: 0% 50%;	}	50% {	  background-position: 100% 50%;	}	100% {	  background-position: 0% 50%;	}      }      @keyframes swiping {        0% {	  background-position: 0% 200%;	}	100% {	  background-position: 200% 200%;	}      }      tooltip {	background: #${palette.base00};	border: 1px solid #${palette.base0E};	border-radius: 10px;      }      tooltip label {	color: #${palette.base07};      }      
            #window {	color: #${palette.base05};	background: #${palette.base00};	border-radius: 50px 15px 50px 15px;	margin: 5px;	padding: 2px 20px;      }      
            #memory {   	color: #${palette.base0F};	background: #${palette.base00};	border-radius: 50px 15px 50px 15px;	margin: 5px;	padding: 2px 20px;      }      
            #clock {    	color: #${palette.base0B};	background: #${palette.base00};	border-radius: 15px 50px 15px 50px;	margin: 5px;	padding: 2px 20px;      }      
            #cpu {    	color: #${palette.base07};	background: #${palette.base00};	border-radius: 50px 15px 50px 15px;	margin: 5px;	padding: 2px 20px;      }      
            #disk {    	color: #${palette.base03};	background: #${palette.base00};	border-radius: 15px 50px 15px 50px;	margin: 5px;	padding: 2px 20px;      }      
            #battery {    	color: #${palette.base08};	background: #${palette.base00};	border-radius: 15px 50px 15px 50px;	margin: 5px;	padding: 2px 20px;      }      
            #network {    	color: #${palette.base09};	background: #${palette.base00};	border-radius: 50px 15px 50px 15px;	margin: 5px;	padding: 2px 20px;      }      
            #custom-hyprbindings {    	color: #${palette.base0E};	background: #${palette.base00};	border-radius: 15px 50px 15px 50px;	margin: 5px;	padding: 2px 20px;      }      
            #tray {    	color: #${palette.base05};	background: #${palette.base00};	border-radius: 15px 0px 0px 50px;	margin: 5px 0px 5px 5px;	padding: 2px 20px;      }      
            #pulseaudio {    	color: #${palette.base0D};	background: #${palette.base00};	border-radius: 50px 15px 50px 15px;	margin: 5px;	padding: 2px 20px;      }      
            #custom-notification {    	color: #${palette.base0C};	background: #${palette.base00};	border-radius: 15px 50px 15px 50px;	margin: 5px;	padding: 2px 20px;      }     
            #custom-themeselector {    	color: #${palette.base0D};	background: #${palette.base00};	border-radius: 0px 50px 15px 0px;	margin: 5px 0px;	padding: 2px 15px 2px 5px;      }      
            #custom-startmenu {    	color: #${palette.base03};	background: #${palette.base00};	border-radius: 0px 15px 50px 0px;	margin: 5px 5px 5px 0px;	padding: 2px 20px;      }      
            #idle_inhibitor {    	color: #${palette.base09};	background: #${palette.base00};	border-radius: 0px;	margin: 5px 0px;	padding: 2px 14px;      }      
            #custom-exit {    	color: #${palette.base0E};	background: #${palette.base00};	border-radius: 15px 0px 0px 50px;	margin: 5px 0px;	padding: 2px 5px 2px 15px;      } ''    ];

    };
}