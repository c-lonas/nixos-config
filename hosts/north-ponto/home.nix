{ config, pkgs, inputs, gtkThemeFromScheme, ... }:

let
  inherit (import ./options.nix)
  theme;
in
{
  home.username = "battery";
  home.homeDirectory = "/home/battery";

  colorScheme = inputs.nix-colors.colorSchemes."${theme}";

  imports = [
    ../../modules/home-manager/bash.nix
    ../../modules/home-manager/kitty.nix
    ../../modules/home-manager/hyprland.nix
    ../../modules/home-manager/swaylock.nix
    ../../modules/home-manager/waybar.nix
    ../../modules/home-manager/wofi.nix
    ../../modules/home-manager/wlogout.nix
    inputs.nix-colors.homeManagerModules.default
  ];

 
  

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    pavucontrol
    noto-fonts-color-emoji
    material-icons
    symbola
    font-awesome
    swayidle
    swaylock
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    (import ../../scripts/wallsetter.nix { inherit pkgs; })
    (import ../../scripts/themechange.nix { inherit pkgs; })

  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    ".local/share/fonts" = {
      source = ../../modules/home-manager/files/fonts;
      recursive = true; 
    };
    ".config/wlogout/icons" = {
      source = ../../modules/home-manager/files/wlogout;
      recursive = true;
    };
    ".config/swaylock" = {
      source = ../../modules/home-manager/files/swaylock;
      recursive = true;
    };

  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/battery/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true; # Duplicate of line in packgages.nix, remember to resolve

  home.stateVersion = "23.11"; # Don't Change
}
