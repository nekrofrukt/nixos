{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      fzf
      #xclip
      wl-clipboard
    ];

    initLua = ''
      require("config.lazy")

      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.clipboard = "unnamedplus"
    '';
  };
}
