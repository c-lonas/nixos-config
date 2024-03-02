{ pkgs, config, lib, ... }:

{
    programs.kitty = {
        package = pkgs.kitty;
        enable = true;
        font.name = "JetBrainsMono Nerd Font";
        font.size = 16;
        settings = {
            window_padding_width = 4;
            wheel_scroll_min_lines = 1;
            confirm_os_window_close = 0;
            background_opacity = "0.85";
        };
    };
}