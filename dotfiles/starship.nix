{ config, pkgs, ... }:

{
  home.file.".config/starship.toml" = {
    text = ''
      format = """
      $directory$git_branch$git_status$cmd_duration
      $nix_shell$character
      """

      [username]
      format = "$user"
      show_always = true

      [hostname]
      format = "@$hostname"
      ssh_only = false

      [character]
      success_symbol = "[»](bold green)"
      error_symbol = "[»](bold red)"
      
      [nix_shell]
      disabled = false
      format = "nix-shell "
      style = "bold blue"
    '';
    force = true;
  };
}
