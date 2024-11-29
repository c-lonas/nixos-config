{ config, pkgs, hostSystemProfile, ... }:

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
  selectedPackages = if hostSystemProfile == "minimal" then
    minimalPackages
  else if hostSystemProfile == "lightweight" then
    lightweightPackages
  else if hostSystemProfile == "full" then
    fullPackages
  else
    minimalPackages;  # Default to minimal

in
{
    home.username = "chase";
    home.homeDirectory = "/home/chase";

    home.packages = selectedPackages;
    home.sessionVariables = { HOST_SYSTEM_PROFILE = config.hostSystemProfile; }; 

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