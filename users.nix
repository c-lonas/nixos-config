{ config, pkgs, ...}: {


    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users = {
        
        chase = {
            isNormalUser = true;
            #home = "/home/chase";
            extraGroups = [ "wheel" "networkmanager" "docker" ];
            packages = with pkgs; [
                firefox
                vscode
                tree
            ];
        };

        joelyn = {
            isNormalUser = true;
            #home = "/home/joelyn";
            extraGroups = [ "docker" ];
            packages = with pkgs; [
                firefox
                cowsay
                lolcat
            ];
        };

    };
}
