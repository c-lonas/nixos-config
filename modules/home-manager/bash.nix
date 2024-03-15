{ config, lib, pkgs, ... }:

{
    
programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
        ls="lsd";
        ll="lsd -l";
        la="lsd -a";
    };
};

}