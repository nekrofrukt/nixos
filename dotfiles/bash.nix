{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos btw";
      ls = "ls -a";
      update_flake = "sudo nix flake update";
      rebuild_switch = "sudo nixos-rebuild switch --flake .#default";
      collect_garbage = "sudo nix-collect-garbage --delete-older-than 5";
      cdnix = "cd /etc/nixos/";
    };
  };
}
