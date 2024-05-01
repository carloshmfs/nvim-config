require("nvim-tree").setup({
    actions = {
        open_file = {
            quit_on_open = true
        }
    },

    on_attach = function (bufnr)
        local api = require('nvim-tree.api')

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set('n', '<leader>pv', vim.cmd.NvimTreeToggle, { silent  = true, noremap = true })
    end
})
