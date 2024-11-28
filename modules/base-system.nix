{ config, pkgs, ... }:

{

  nix.settings.experimental-features= [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [

    # Text Editors
    vim 
    
    # VCS
    git

    # Utilities
    wget
    curl
    fzf
    bc
    jq
    rsync
    plocate

    # Monitoring
    htop
    btop

    # Archives
    zip
    unzip
    gnutar

    # Networking
    dnsutils
    socat
    nmap
    traceroute
    lsof

    # Misc
    which
    tree
    gnused
    gawk
    file

  ];

  # These addresses need to match the values set in each host's configuration.nix
  networking.hosts = {
    "192.168.1.6" = ["south-ponto"];
    "192.168.1.7" = ["north-ponto"];
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };


}