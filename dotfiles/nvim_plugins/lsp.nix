{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gopls
    javascript-typescript-langserver
    lua-language-server
    nixd
    pyright
  ];

  #home.file.".config/nvim/lua/plugins/lsp.lua" = {
  #  text = ''
  #    return {
  #      {
  #        "neovim/nvim-lspconfig",
  #        opts = function(_, opts)
  #          opts.servers = {
  #            lua_ls = {},
  #	      gopls = {},
  #            -- nixd = {},
  #            pyright = {},
  #	      tsserver = {},
  #          }
  #	  end,
  #      }
  #    }
  # '';
  #  force = true;
  #};
}

