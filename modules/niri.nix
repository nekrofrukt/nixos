{ config, pkgs, inputs, ... }:

{
  imports = [
    #./noctalia.nix
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
    swayidle
    swaylock
    waybar
    xcursor-themes
    xwayland-satellite
  ];

  # DEPENDENCIES
  hardware.bluetooth.enable = true;
  #services.dbus.enable = true; <- probably handeled by NixOS
  security.polkit.enable = true;

  # DANK MATERIAL SHELL
  #programs.dms-shell = {
  #  enable = true;

  #  systemd = {
  #    enable = true;             # Systemd service for auto-start
  #    restartIfChanged = true;   # Auto-restart dms.service when dms-shell changes
  #};
  
  #  # Core features
  #  enableSystemMonitoring = true;     # System monitoring widgets (dgop)
  #  enableVPN = false;                 # VPN management widget
  #  enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
  #  enableAudioWavelength = true;      # Audio visualizer (cava)
  #  enableCalendarEvents = true;       # Calendar integration (khal)
  #  enableClipboardPaste = true;       # Pasting from the clipboard history (wtype)
  #};
}
