{ config, pkgs, ... }:

{
  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Home-Manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = { inherit inputs; };

    users = {
      "nekrofrukt" = import ../../home.nix;
    };
  };

  # Tailscale
  services.tailscale.enable = true;

  # Swapfile
  swapDevices = [ {
    device = "/swapfile";
    size = 4096; # <-- 4 GB swap
  } ];

  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = [ "weekly" ];
    options = "--delete-older-than 7d";
  };
}
