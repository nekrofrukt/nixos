{ config, pkgs, ... }:

{
  # GNOME DESKTOP
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  
  # X11 WINDOWING SYSTEM
  services.xserver.enable = true;

  # FLATPAK
  services.flatpak.enable = true;

  # GNOME SPECIFIC PKGS
  environment.systemPackages = let
   ge = pkgs.gnomeExtensions;
  in with pkgs; [
    gnome-tweaks
    # Extensions
    gnomeExtensions.app-menu-is-back
    gnomeExtensions.appindicator
    gnomeExtensions.forge
    ge.just-perfection
    gnomeExtensions.space-bar
    gnomeExtensions.system-monitor
    gnomeExtensions.user-themes
  ];

  services.gnome.gnome-keyring.enable = true;
}
