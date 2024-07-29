return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            view_options = {
                show_hidden = true
            },
            keymaps = {
                ["<C-p>"] = false,
                ["<C-a>"] = "actions.preview",
            }
        })
    end
}

