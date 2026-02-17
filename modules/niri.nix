{ config, pkgs, inputs, ... }:

{
  # NIRI, DM, X11 WINDOWING SYSTEM
  programs.niri.enable = true;
  services.displayManager.gdm.enable = true;
  services.xserver.enable = true;

  # NIRI SPECIFIC PKGS
  environment.systemPackages = with pkgs; [
    alacritty
    fuzzel
    #mako
    noctalia-shell
    rofi
    swaybg
    xwayland-satellite
  ];

  # NOCTILIA DEPENDENCIES
  hardware.bluetooth.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
