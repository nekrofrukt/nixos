{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    # LAUNCH STARSHIP
    initExtra = ''
      eval "$(starship init bash)"
    '';

    shellAliases = {
      btw = "echo i use unpure nix btw";
      ls = "ls -a";
      update_flake = "sudo nix flake update";
      rebuild_switch = "sudo nixos-rebuild switch --flake .#t14";
      rebuild_switch_impure = "sudo nixos-rebuild switch --flake .#t14 --impure";
      collect_garbage = "sudo nix-env --delete-generations +5 --profile /nix/var/nix/profiles/system && sudo nix-collect-garbage -d";
      cd_etc = "cd /etc/nixos/";
      cd_nixos = "cd ~/src/nixos";
    };
  };
}
