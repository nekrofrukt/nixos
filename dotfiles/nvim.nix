{ config, pkgs, ... }:

{
  imports = [
    #./nvim_plugins/lsp.nix
    ./nvim_plugins/lazyvim.nix
    ./nvim_plugins/mason.nix
  ];

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

	-- CMP setup
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
          local cmp = require("cmp")

          opts.mapping = cmp.mapping.preset.insert({
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
          })

          opts.sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "buffer" },
          })
        end,
      }
    '';
    force = true;
  };
}
