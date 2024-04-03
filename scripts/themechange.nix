{ pkgs, ... }:


pkgs.writeShellScriptBin "themechange" ''
    if [[ ! $@ ]]; then
        echo "No Theme Given"
    else
        echo "Theme was given"
    fi
''
