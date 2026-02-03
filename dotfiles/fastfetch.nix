{ config, pkgs, ... }:

{
  home.file.".config/fastfetch/config.jsonc" = {
    text = ''



   '';
    force = true;
  };
}
