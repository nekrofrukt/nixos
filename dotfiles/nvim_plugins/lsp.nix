{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gopls
    javascript-typescript-langserver
    lua-language-server
    nixd
    pyright
  ];

  home.file.".config/nvim/lua/plugins/lsp.lua" = {
    text = ''
      return {
        {
          "neovim/nvim-lspconfig",
          opts = {
          servers = {
          lua_lsp = {},
	  gopls = {},
          nixd = {},
          python-lsp-server = {},
	  typescript-language-server = {},
          },
        },
      },
    }
    '';
    force = true;
  };
}
