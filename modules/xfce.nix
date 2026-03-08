{ config, pkgs, ... }:

{
  # XFCE DESKTOP
  services.displayManager.lightdm.enable = true;
  services.desktopManager.xfce.enable = true;
  
  # X11 WINDOWING SYSTEM
  services.xserver.enable = true;

  # FLATPAK
  services.flatpak.enable = true;

  # XFCE SPECIFIC PKGS
  environment.systemPackages = with pkgs; [
  ];
}
