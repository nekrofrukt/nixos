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
  environment.systemPackages = with pkgs; [
    
    # Extensions
    gnome-tweaks
    gnomeExtensions.app-menu-is-back
    gnomeExtensions.appindicator
    gnomeExtensions.forge
    gnomeExtensions.pop-shell
    gnomeExtensions.space-bar
    gnomeExtensions.system-monitor
    #gnomeExtensions.appindicator
  ];

  # SESSION VARIABLES
  #environment.sessionVariables = {
  #  GTK_MODULES = "appindicator";
  #};

  services.gnome.gnome-keyring.enable = true;
}
