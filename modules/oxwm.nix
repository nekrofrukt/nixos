{ config, pkgs, ... }:

{
  services.displayManager.lightdm.enable = true;
  services.xserver = {
    enable = true;
    windowManager.oxwm.enable = true;
  };
  
  # X11 WINDOWING SYSTEM
  #services.xserver.enable = true;

  # FLATPAK
  services.flatpak.enable = true;

  #services.gnome.gnome-keyring.enable = true;

  # OXWM SPECIFIC PKGS
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme   
    blueman
    eog
    gnome-disk-utility
    gnome-software
    gnome-text-editor
    gnome-themes-extra
    mako
    nautilus
    nmgui
    rofi
    sushi
    swaybg
    swayidle
    swaylock
    waybar
    xcursor-themes
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
    xwayland-satellite
  ];
}
