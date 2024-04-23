{ pkgs, ... }:


pkgs.writeShellScriptBin "wallsetter" ''

    WALLPAPER_DIR="/home/battery/battery-wallpapers"
    WALLPAPER="/home/battery/shaded_landscape.png"
    WALLPAPER2="/home/battery/nix-magenta.png"


    if [ -d $WALLPAPER_DIR ]; then
        echo "Found wallpaper directory!"
    else
        echo "Can't find wallpaper directory :("
    fi
    ${pkgs.swww}/bin/swww img "$WALLPAPER"
''