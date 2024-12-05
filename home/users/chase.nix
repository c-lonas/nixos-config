{ config, pkgs, hostSystemProfile, dewmHomeModule,  base16ThemeChoice, ... }:

with pkgs;
let

  minimalPackages =  [
    neovim
    starship
    cbonsai
    dropbox
  ];

  lightweightPackages = minimalPackages ++ [
    discord
    cmatrix
    obsidian
  ];

  fullPackages = lightweightPackages ++ [
    lolcat
    steam
  ];


  # Select the appropriate package set based on hostSystemProfile
  systemProfilePackages = if hostSystemProfile == "minimal" then
    minimalPackages
  else if hostSystemProfile == "lightweight" then
    lightweightPackages
  else if hostSystemProfile == "full" then
    fullPackages
  else
    minimalPackages;  # Default to minimal

  userPackages = systemProfilePackages; # Assuming I may need to add additional packages for dw/wm to systemProfilePackages

in
{
  home.username = "chase";
  home.homeDirectory = "/home/chase";

  home.packages = userPackages;
  home.sessionVariables = { HOST_SYSTEM_PROFILE = config.hostSystemProfile; }; 


  imports = [
    dewmHomeModule
  ];

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/${base16ThemeChoice}.yaml";

  # Enable Bash
  programs.bash = {
      enable = true;
      enableCompletion = true;
      initExtra = ''
        if command -v starship > /dev/null 2>&1; then
            eval "$(starship init bash)"
        fi
      '';
  };

  home.stateVersion = "25.05";
}