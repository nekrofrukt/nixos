{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    # LAUNCH STARSHIP
    initExtra = ''
      eval "$(starship init bash)"
    '';

    shellAliases = {
      btw = "echo i use nix btw";
      ls = "ls -a";

      update_flake = "sudo nix flake update";
      rebuild_switch_t14 = "sudo nixos-rebuild switch --flake .#t14";
      rebuild_test_t14 = "sudo nixos-rebuild test --flake .#t14";
      collect_garbage = "sudo nix-collect-garbage --delete-older-than 7d";
      
      cd_etc = "cd /etc/nixos/";
      cd_nixos = "cd ~/src/nixos";

      ff_m = "fastfetch --config ~/.config/fastfetch/minimal.jsonc";
    };
  };
}
