{ config, pkgs, ... }:

{
    home.username = "chase";
    home.homeDirectory = "/home/chase";

    home.packages = with pkgs; [
        starship
    ];


    programs.home-manager.enable = true;


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