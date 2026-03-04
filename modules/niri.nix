{ config, pkgs, inputs, ... }:

{
  # NIRI, DM, X11 WINDOWING SYSTEM
  programs.niri.enable = true;
  services.displayManager.gdm.enable = true;
  services.xserver.enable = true;

  # NIRI SPECIFIC PKGS
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme   
    blueman
    eog
    gnome-disk-utility
    gnome-text-editor
    gnome-themes-extra
    mako
    nautilus
    nmgui
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

  # FLATPAK
  services.flatpak.enable = true;

  # DEPENDENCIES
  hardware.bluetooth.enable = true;
  security.polkit.enable = true;
  services.gvfs.enable = true;
  #services.dbus.enable = true; <- probably handeled by NixOS
}
