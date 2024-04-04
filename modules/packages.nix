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
    polkit_gnome
    networkmanagerapplet
    lsd
    lshw
    unzip
    
    
    symbola
    font-awesome
    noto-fonts-color-emoji
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}