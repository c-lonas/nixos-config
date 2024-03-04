{ pkgs, ... }:

{
  
  # List system packages
  environment.systemPackages = with pkgs; [

    git
    vim
    neovim
    vscode
    kitty
    dropbox
    firefox
    wofi
    neofetch
    curl
    wget
    btop
    obsidian
    waybar
    swww
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}