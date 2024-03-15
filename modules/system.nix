{ config, pkgs, lib, ... }:

{
    
    # Enable Flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Bootloader
    boot.loader.systemd-boot.enable = true; boot.loader.efi.canTouchEfiVariables = true;

    # Set your time zone.
    time.timeZone = "America/Los_Angeles";

    # Enable networking
    networking.networkmanager.enable = true;

    # 
    services.xserver = {
      enable = true;
      xkb = { layout = "us"; variant = "";
      };
      libinput.enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable bluetooth
    hardware.bluetooth.enable = true;

    # Enable openSSH
    services.openssh.enable = true;

    # Enable fstrim
    services.fstrim.enable = true;

    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal
      ];
      configPackages = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal
      ];
    };

    # Enable sound with pipewire
    sound.enable = true; 
    hardware.pulseaudio.enable = false; 
    security.rtkit.enable = true; 
    services.pipewire = {
        enable = true; 
        alsa.enable = true; 
        alsa.support32Bit = true; 
        pulse.enable = true;
        jack.enable = true;
    };


    services.tumbler.enable = true;
    services.gnome.gnome-keyring.enable = true;
    security.pam.services.swaylock = {
      text = ''
        auth include login
      '';
    };

    environment.variables = {
      POLKIT_BIN = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    };

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = { 
    LC_ADDRESS = "en_US.UTF-8"; 
    LC_IDENTIFICATION = "en_US.UTF-8"; 
    LC_MEASUREMENT = "en_US.UTF-8"; 
    LC_MONETARY = "en_US.UTF-8"; 
    LC_NAME = "en_US.UTF-8"; 
    LC_NUMERIC = "en_US.UTF-8"; 
    LC_PAPER = "en_US.UTF-8"; 
    LC_TELEPHONE = "en_US.UTF-8"; 
    LC_TIME = "en_US.UTF-8";
    };

  # Set the default editor
  # environment.variables.EDITOR = "vim";

    # Hyprland
    nix.settings.substituters = ["https://hyprland.cachix.org"];
    nix.settings.trusted-public-keys = [
    "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];




  system.stateVersion = "23.11"; # Don't change
}

