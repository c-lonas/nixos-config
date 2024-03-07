{ pkgs, ... }:


pkgs.writeShellScriptBin "wallsetter" ''

    WALLPAPER="/home/battery/shaded_landscape.png"
    WALLPAPER2="/home/battery/nix-magenta.png"

    ${pkgs.swww}/bin/swww img "$WALLPAPER"
''