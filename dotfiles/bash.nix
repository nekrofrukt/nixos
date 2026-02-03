{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    initExtra = ''
      eval "$(starship init bash)"
    '';

    shellAliases = {
      btw = "echo i use unpure nix btw";
      ls = "ls -a";
      update_flake = "sudo nix flake update";
      rebuild_switch = "sudo nixos-rebuild switch --flake .#t14";
      rebuild_switch_impure = "sudo nixos-rebuild switch --flake .#t14 --impure";
      collect_garbage = "sudo nix-collect-garbage --delete-older-than 5";
      cdnix = "cd /etc/nixos/";
    };
  };
}
