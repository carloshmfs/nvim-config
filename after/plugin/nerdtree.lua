require("nvim-tree").setup({
    on_attach = function (bufnr)
        local api = require('nvim-tree.api')

        api.config.mappings.default_on_attach(bufnr)

        vim.keymap.set('n', '<leader>pv', vim.cmd.NvimTreeToggle, { silent  = true, noremap = true })
    end
})