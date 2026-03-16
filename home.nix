{ config, pkgs, ... }:

let
  symLink = path: config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/nixos/dotfiles/${path}";
in

{
  home.username = "nekrofrukt";
  home.homeDirectory = "/home/nekrofrukt";
  home.stateVersion = "25.11";

  # IMPORTS
  imports = [
    ./dotfiles/bash/bash.nix
    ./dotfiles/nvim/nvim.nix
    ./dotfiles/ssh/ssh.nix
  ];
  
  home.packages = with pkgs; [
    _1password-gui
    brave
    btop-rocm
    fastfetch
    ghostty
    obsidian
    spotify
    starship
    transmission_4-qt
    vlc

    # Languages
    go
    lua
    python315

    # Fonts
    #jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-mono
  ];

  home.file = {
    ".config/ghostty/config".source = ./dotfiles/ghostty/default;
    ".config/starship.toml".source = ./dotfiles/starship/starship.toml;
    ".config/gtk-4.0/gtk.css".source = ./dotfiles/gtk-4.0/gtk.css;
    ".config/gtk-4.0/settings.ini".source = ./dotfiles/gtk-4.0/settings.ini;
    ".config/mako/config".source = ./dotfiles/mako/config;

    # Symlinks
    ".config/fastfetch/config.jsonc".source = symLink "fastfetch/default.jsonc";
    ".config/fastfetch/minimal.jsonc".source = symLink "fastfetch/minimal.jsonc";
    ".config/waybar/config.jsonc".source = symLink "waybar/config.jsonc";
    ".config/waybar/style.css".source = symLink "waybar/style.css";
    ".config/rofi".source = symLink "rofi";
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/nekrofrukt/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
