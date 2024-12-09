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

  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};

in
{
  home.username = "kids";
  home.homeDirectory = "/home/kids";

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

  # Enable Firefox
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
      };
    };
  };

  # Enable Starship
  programs.starship = {
    enable = true;
    settings = {
      directory = {
        truncate_to_repo = false;
      };

      git_branch = {
        symbol = "  "; 
        format = "[$symbol$branch]($style) ";
      };

      format = 
        "$sudo" +
        "$directory" +
        "$kubernetes" +
        "$docker_context" +
        "$package" +
        "$c" +
        "$dotnet" +
        "$gleam" +
        "$golang" +
        "$nodejs" +
        "$python" +
        "$rust" +
        "$terraform" +
        "$nix_shell" +
        "$aws" +
        "$gcloud" +
        "$openstack" +
        "$azure" +
        "$git_branch" +
        "$container" +
        "$jobs" +
        "\n$username" +
        "$hostname" +
        "$character";
    };
  };


  home.stateVersion = "25.05";
}