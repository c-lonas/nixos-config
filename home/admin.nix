{ config, pkgs, hostSystemProfile, ... }:

with pkgs;
let
  minimalPackages =  [
    neovim
    starship
    cbonsai
  ];

  lightweightPackages = minimalPackages ++ [
    cmatrix
  ];

  fullPackages = lightweightPackages ++ [
    lolcat
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
    home.username = "admin";
    home.homeDirectory = "/home/admin";

    home.packages = selectedPackages;


    # Enable Bash
    programs.bash = {
        enable = true;
        enableCompletion = true;
        initExtra = ''
            if [ -f ~/.config/starship.toml ]; then
                eval "$(starship init bash)"
            fi
        '';
    };


    # Enable Starship
    programs.starship.enable = true;

    programs.starship.settings = {
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
            "$username" +
            "$hostname" +
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
            "\n$character";
    };

    home.stateVersion = "25.05";
}