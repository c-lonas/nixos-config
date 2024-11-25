{ config, pkgs, ... }:

{
    home.username = "admin";
    home.homeDirectory = "/home/admin";

    home.packages = with pkgs; [
        starship
    ];

    # Enable Home Manager
    programs.home-manager.enable = true;

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