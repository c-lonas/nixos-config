let 
    hostname = "north-ponto";
    theme = "catppuccin-mocha";
in {

    # Define Hostname
    networking.hostName = "$hostname";

    # Define Theme
    theme = "$theme";
}