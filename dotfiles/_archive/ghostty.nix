{ config, pkgs, ... }:

{
  home.file.".config/ghostty/config" = {
    text = "
      # Visuals
      #theme = Firewatch
      #theme = TokyoNight Night
      theme = Everforest Dark Hard
      window-padding-x = 10,4
      #window-decoration = none
      background-opacity = 0.95

      # Font configuration
      font-family = JetBrains Mono Medium
      font-size = 14
      
      # Cursor configuration
      mouse-hide-while-typing = true
      cursor-style-blink = true
      #cursor-style = block
      shell-integration-features = no-cursor
    ";
    force = true;
  };
}
