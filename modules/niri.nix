{ config, pkgs, inputs, ... }:

{
  imports = [
    #./noctalia.nix
  ];

  # NIRI, DM, X11 WINDOWING SYSTEM
  programs.niri.enable = true;
  services.displayManager.gdm.enable = true;
  services.xserver.enable = true;

  # NIRI SPECIFIC PKGS
  environment.systemPackages = with pkgs; [
    alacritty
    fuzzel
    mako
    rofi
    swaybg
    waybar
    xwayland-satellite
  ];
}
