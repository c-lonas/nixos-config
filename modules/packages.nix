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
    rofi-wayland
    neofetch
    cmatrix
    curl
    wget
    btop
    obsidian
    discord
    waybar
    swww
    polkit_gnome
    networkmanagerapplet
    lsd
    lshw
    unzip
    libnotify
    
    symbola
    font-awesome
    noto-fonts-color-emoji
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}