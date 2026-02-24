{ config, pkgs, inputs, ... }:

{
  imports = [
    #./walker.nix
  ];

  # NIRI, DM, X11 WINDOWING SYSTEM
  programs.niri.enable = true;
  services.displayManager.gdm.enable = true;
  services.xserver.enable = true;

  # NIRI SPECIFIC PKGS
  environment.systemPackages = with pkgs; [
    blueman
    mako
    nmgui
    quickshell
    swaybg
    swayidle
    swaylock
    waybar
    wleave
    wofi
    xcursor-themes
    xwayland-satellite
  ];

  # DEPENDENCIES
  hardware.bluetooth.enable = true;
  #services.dbus.enable = true; <- probably handeled by NixOS
  security.polkit.enable = true;
}
