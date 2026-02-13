{ config, pkgs, ... }:

{
  # NIRI WM
  programs.niri.enable = true;
  
  # NIRI SPECIFIC PKGS
  environment.systemPackages = with pkgs; [
    mako
    rofi
    swaybg
    waybar
    xwayland-satellite
  ];
}
