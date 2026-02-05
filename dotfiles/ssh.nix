{ config, pkgs, ... }:

{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "github.com" = {
        user = "git";
	hostname = "github";
	identityFile = "~/.ssh/id_ed25519";
	identitiesOnly = true;
      };

      "raspberry-pi" = {
        hostname = "192.168.1.60";
	user = "nekrofrukt";
      };

      "tailscale-pi" = {
        hostname = "100.77.202.15";
	user = "nekrofrukt";
      };
    };
  };

  services.ssh-agent.enable = true;
}
