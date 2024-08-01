return {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release'
        }
    },
    config = function()
        require("telescope").load_extension("fzf")
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
