{ config, pkgs, ... }:

{
  home.file.".config/ghostty/config" = {
    text = "
      # Visuals
      #theme = Catppuccin Mocha
      theme = Firewatch
      window-padding-x = 10,4
      #window-decoration = none

      # Font configuration
      font-family = JetBrains Mono Medium
      font-size = 14
      
      # Cursor configuration (not perfect!)
      mouse-hide-while-typing = true
      cursor-style-blink = true
      #cursor-style = block
      shell-integration-features = no-cursor
    ";
    force = true;
  };
}
