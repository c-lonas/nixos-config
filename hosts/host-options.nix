
####################### DE/WM #######################
# The `dewm` option needs to match an available DE/WM
# module under /modules/dewm/

################ Host System Profile ################
# The `hostSystemProfile` option must be one of 
# ['minimal', 'lightweight', 'full'], and is used
# by the /home/<user>.nix file to determine which
# user packages should be installed on a given host


################ Base16 System Theme #################
# This option is not currently in use- it coud be 
# passed into /modules/theming/stylix.nix to set
# the system theme (used by the bootloader such before
# a user session is initiated) on a per-host basis


{
  "north-ponto" = {
    dewm = "kde-plasma";
    hostSystemProfile = "lightweight";
    base16SystemTheme = "ayu-dark";
  };

  "south-ponto" = {
    dewm = "kde-plasma";
    hostSystemProfile = "lightweight";
    base16SystemTheme = "ayu-dark";
  };

  "la-jolla-cove" = {
    dewm = "kde-plasma";
    hostSystemProfile = "full";
    base16SystemTheme = "ayu-dark";
  };
}
