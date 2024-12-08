{ config, lib, pkgs, ... }:

{

  # Not sure if this is where this should be handled
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  programs.gamemode.enable = true;
  hardware.graphics.enable = true;


  environment.systemPackages = with pkgs; [
    mangohud
    lutris
    bottles
    wowup-cf
  ];

}