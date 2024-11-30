
####################### DE/WM #######################
# The `dewm` option needs to match an available DE/WM
# module under /modules/dewm/

################ Host System Profile ################
# The `hostSystemProfile` option must be one of 
# ['minimal', 'lightweight', 'full'], and is used
# by the /home/<user>.nix file to determine which
# user packages should be installed on a given host



{
  "north-ponto" = {
    dewm = "kde-plasma";
    hostSystemProfile = "lightweight";
  };

  "south-ponto" = {
    dewm = "kde-plasma";
    hostSystemProfile = "lightweight";
  };
}
