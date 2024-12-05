{ pkgs, currentHostOptions, ... }:

{
  # Enable stylix - probably move this block to /modules/theme/stylix.nix
  stylix = {
    enable = true;
    image = ./gray.jpg; # This will be overridden
    polarity = "dark";
    fonts.sizes.terminal = 16;
    opacity = {
      applications = 0.85;
      terminal = 0.85;
    };
    # This is the theme that will be used by the bootloader and such before 
    # it is overridden by the user theme.
    # This could be set per host via host-options.nix
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml"; 
  };

}