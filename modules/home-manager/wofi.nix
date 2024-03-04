{ pkgs, config, lib, ... }:

{
  programs.wofi = {
    enable = true;
    package = pkgs.wofi;
    settings = {
      show = "drun";
      width = "40%";
      height = "50%";
      prompt = "Search...";
      normal_window = true;
      location = "center";
      gtk_dark = true;
      allow_images = true;
      image_size = 32;
      insensitive = true;
      allow_markup = true;
      no_actions = true;
      orientation = "vertical";
      halign = "fill";
      content_halign = "fill";
    };
    style = ''
      window {
        background-color: #171717;
      }

      * {
        font-family: "JetBrainsMono Nerd Font;
        color: #fff;
      }

      #scroll {
        padding: 0.5rem;
      }

      #input {
        background-color: #262626;
        outline: none;
        box-shadow: none;
        border: 0;
        border-radius: 0;
        font-size: 1rem;
        padding: 0.5rem;
      }

      #inner-box {
        margin: 0.5rem;
        font-size: 1rem;
      }

      #img {
        margin: 10px 10px;
      }

      #entry {
        border-radius: 0.5rem;
      }

      #entry:selected {
        background-color: #262626;
        outline: none;
      }
    '';
  };
}
