return {
    'VonHeikemen/lsp-zero.nvim', branch = 'v2.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
     },
    config = function ()
        local lsp = require('lsp-zero').preset({})

        lsp.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            -- to learn the available actions
            lsp.default_keymaps({buffer = bufnr})
        end)

        -- LSP configs
        local lspconfig = require('lspconfig')
        lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
        -- lspconfig.clangd.setup({
        --     cmd = {
        --         "clangd",
        --         "--query-driver",
        --         lspconfig.util.find_git_ancestor(vim.fn.getcwd()) .. '/Toolchain/Local/**/*',
        --         "--header-insertion=never",
        --         "--clang-tidy",
        --     }
        -- })
        lspconfig.html.setup({
            filetypes = {
                'blade',
                'php'
            }
        })

        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        local cmp_mappings = lsp.defaults.cmp_mappings({
            ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
            ["<C-y>"] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
        })

        -- lsp.set_sign_icons({
        --     error = '✘',
        --     warn = '▲',
        --     hint = '⚑',
        --     info = '»'
        -- })

        lsp.setup()
    end
}
