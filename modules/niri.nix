{ config, pkgs, inputs, ... }:

{
  # NIRI, DM, X11 WINDOWING SYSTEM
  programs.niri.enable = true;
  services.displayManager.gdm.enable = true;
  services.xserver.enable = true;

  #services.greetd = {
  #  enable = true;
  #  settings = {
  #    default_session = {
  #      #command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri";
  #      command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd '${pkgs.dbus}/bin/dbus-run-session ${pkgs.niri}/bin/niri'";
  #      user = "greeter";
  #    };
  #  };
  #};

  # NIRI SPECIFIC PKGS
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme   
    blueman
    gnome-disk-utility
    gnome-text-editor
    gnome-themes-extra
    mako
    nautilus
    nmgui
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

  # POLKIT AGENT
  #systemd.user.services.polkit-gnome-authentication-agent-1 = {
  #  description = "polkit-gnome-authentication-agent-1";
  #  wantedBy = [ "graphical-session.target" ];
  #  wants = [ "graphical-session.target" ];
  #  after = [ "graphical-session.target" ];
  #  serviceConfig = {
  #    Type = "simple";
  #    ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  #    Restart = "on-failure";
  #    RestartSec = 1;
  #    TimeoutStopSec = 10;
  #  };
  #};

  # GNOME KEYRING SERVICES
  #systemd.user.services.gnome-keyring = {
  #  description = "GNOME Keyring Daemon";
  #  after = [ "dbus.service" ];
  #  wantedBy = [ "default.target" ];
  #  serviceConfig = {
  #    ExecStart = "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --start --components=secrets";
  #    Type = "simple";
  #    Restart = "on-failure";
  #  };
  #};
}
