{ config, pkgs, ... }:

{
  home.file.".config/starship.toml" = {
    text = ''
      format = """
      $directory$git_branch$git_status$cmd_duration
      $character
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
    '';
    force = true;
  };
}
