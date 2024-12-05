{ pkgs, config, lib, ... }:

{
    programs.kitty = {
        package = pkgs.kitty;
        enable = true;
        settings = {
            window_padding_width = 4;
            wheel_scroll_min_lines = 1;
            confirm_os_window_close = 0;
        };
    };
}