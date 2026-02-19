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
    blueman
    fuzzel
    mako
    nmgui
    swaybg
    swayidle
    swaylock
    waybar
    wofi
    xcursor-themes
    xwayland-satellite
  ];

  # DEPENDENCIES
  #services.dbus.enable = true; <- probably handeled by NixOS
  security.polkit.enable = true;
}
