return {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local builtin = require('telescope.builtin')
        local theme = require('telescope.themes').get_dropdown({
            hidden = true,
            no_ignore = true
        })

        vim.keymap.set("n", "<leader>pf", function ()
            builtin.find_files(theme)
        end)

        vim.keymap.set("n", "<C-p>", function ()
            builtin.git_files(theme)
        end)

        vim.keymap.set("n", "<leader>po", function ()
                builtin.lsp_document_symbols(theme)
        end)

        vim.keymap.set("n", "<leader>ps", function ()
           builtin.grep_string({ search = vim.fn.input("Find in files: "), theme = theme })
        end)
    end
}
