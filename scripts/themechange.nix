{ pkgs, ... }:


pkgs.writeShellScriptBin "themechange" ''
  if [[ ! $@ ]];then
    echo "No Theme Given"
  else
    replacement=$1
    sed -i "/^\s*theme[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"$replacement\"/" /home/battery/nixos/hosts/$(hostname)/options.nix
    kitty -e pkexec nixos-rebuild switch --flake /home/battery/nixos#$(hostname)
  fi
''
