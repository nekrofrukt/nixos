return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            highlight = {
               enable = true,
            },
            indent = { enable = true },
            autotage = { enable = true },
            ensure_installed = {
                "lua", "python", "json", "css", "go", "javascript", "html",
            },
            auto_install = false,
         })
    end
}
