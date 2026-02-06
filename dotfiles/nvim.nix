{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      fzf
      luajitPackages.luarocks
      wl-clipboard
    ];

    initLua = ''
      require("config.lazy")

      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.clipboard = "unnamedplus"
    '';
  };

  # Plugins
  home.file.".config/nvim/lua/plugins/plugins.lua" = {
    text = ''
      return {
        -- Colorscheme
	{
	  "folke/tokyonight.nvim",
	  config = function()
	    vim.cmd.colorscheme("tokyonight")
	  end,
	},

	-- Treesitter for syntax highlighting and text objects
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },

	-- UI enhancements
        { "nvim-lualine/lualine.nvim" },
        { "nvim-telescope/telescope.nvim" },
        { "nvim-lua/plenary.nvim" },  -- required by telescope

        -- LSP & autocomplete
        { "neovim/nvim-lspconfig" },
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "L3MON4D3/LuaSnip" },  -- snippet engine
      }
    '';
    force = true;
  };
}
