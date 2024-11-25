{ config, pkgs, ...}: {


    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users = {

        admin = {
            isNormalUser = true;
            extraGroups = [ "wheel" "networkmanager" "docker" ];
            hashedPassword = "$6$1LGr0Wm2w3SMgHvD$AUUPynPy.EMfOMrkNZHiVAStu.g6Po38EZLCDY7aftYw1ieqvfTDF.dMXvULCJjJk125vC2ldT78W23FczYFz1";
            packages = with pkgs; [
                firefox
                vscode
                tree
            ];
        };
        
        chase = {
            isNormalUser = true;
            extraGroups = [ "wheel" "networkmanager" "docker" ];
            packages = with pkgs; [
                firefox
                vscode
                tree
            ];
        };

        joelyn = {
            isNormalUser = true;
            extraGroups = [ "docker" ];
            packages = with pkgs; [
                firefox
                cowsay
                lolcat
            ];
        };

    };
}
