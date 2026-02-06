{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gopls
    javascript-typescript-langserver
    lua-language-server
    nixd
    pyright
  ];

  home.file.".config/nvim/lua/plugins/mason.lua" = {
    text = ''
      return {
        {
	  "williamboman/mason.nvim",
	  build = ":MasonUpdate",
	  opts = {
	    ensure_installed = { "gopls", "lua_ls", "pyright", "tsserver" },
	  },
	},
	{
	  "williamboman/mason-lspconfig.nvim",
	  config = function()
	    require("mason").setup()
	    require("mason-lspconfig").setup({
	      ensure_installed = {},
	    })
	  end,
	},
    }
    '';
    force = true;
  };
}
