return {
    -- gruvbox
    { "ellisonleao/gruvbox.nvim", lazy = true },

    -- rosepine
    { 'rose-pine/neovim', name = 'rose-pine' },

    -- tokyonight
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    { "NLKNguyen/papercolor-theme" },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            transparent_background = true,
            integrations = {
                telescope = true,
                harpoon = true,
                mason = true,
                neotest = true,
            }
        },
        config = function(_, opts)
            require('catppuccin').setup(opts)
            vim.cmd.colorscheme 'catppuccin-mocha'
        end
    }
}
