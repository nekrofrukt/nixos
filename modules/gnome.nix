{ config, pkgs, ... }:

{
  # GNOME DESKTOP
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  
  # X11 WINDOWING SYSTEM
  services.xserver.enable = true;

  # GNOME SHELL EXTENSIONS
  environment.systemPackages = with pkgs; [
    gnomeExtensions.pop-shell
    gnomeExtensions.space-bar
  ];

  services.gnome.gnome-keyring.enable = true;
}
