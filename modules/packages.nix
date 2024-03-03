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
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}