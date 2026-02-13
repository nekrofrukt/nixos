{ config, pkgs, ... }:

{
  home.username = "nekrofrukt";
  home.homeDirectory = "/home/nekrofrukt";
  home.stateVersion = "25.11";

  # IMPORTS
  imports = [
    ./dotfiles/bash.nix
    ./dotfiles/nvim.nix
    ./dotfiles/ssh.nix
  ];
  
  home.packages = with pkgs; [
    _1password-gui
    brave
    #dropbox-cli <- instead of flatpak?
    fastfetch
    ghostty
    obsidian
    spotify
    starship
    vlc

    # Languages
    go
    lua
    nodejs_25
    python315
    typescript    

    # Fonts
    jetbrains-mono
 ];

  home.file = {
    ".config/fastfetch/config.jsonc".source = ./dotfiles/fastfetch/default.jsonc;
    ".config/fastfetch/minimal.jsonc".source = ./dotfiles/fastfetch/minimal.jsonc;
    ".config/ghostty/config".source = ./dotfiles/ghostty;
    ".config/starship.toml".source = ./dotfiles/starship.toml;
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
