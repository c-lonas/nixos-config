{ config, pkgs, ...}: {


    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users = {
        
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
