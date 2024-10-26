return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    dependencies = {
        { 'neovim/nvim-lspconfig' },
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },

        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'L3MON4D3/LuaSnip' },
    },
    config = function()
        local lsp_zero = require("lsp-zero")

        vim.opt.signcolumn = 'yes'

        local lspconfig_defaults = require('lspconfig').util.default_config
        lspconfig_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lspconfig_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = { buffer = event.buf }

                vim.keymap.set('n', 'K', function()
                    vim.lsp.buf.hover()
                end, opts)
                vim.keymap.set('n', 'gd', function()
                    vim.lsp.buf.definition()
                end, opts)
                vim.keymap.set('n', 'gD', function()
                    vim.lsp.buf.declaration()
                end, opts)
                vim.keymap.set('n', 'gi', function()
                    vim.lsp.buf.implementation()
                end, opts)
                vim.keymap.set('n', 'go', function()
                    vim.lsp.buf.type_definition()
                end, opts)
                vim.keymap.set('n', 'gr', function()
                    vim.lsp.buf.references()
                end, opts)
                vim.keymap.set('n', 'gs', function()
                    vim.lsp.buf.signature_help()
                end, opts)
                vim.keymap.set('n', '<F2>', function()
                    vim.lsp.buf.rename()
                end, opts)
                vim.keymap.set({ 'n', 'x' }, '<F3>', function()
                    vim.lsp.buf.format({ async = true })
                end, opts)
                vim.keymap.set('n', '<F4>', function()
                    vim.lsp.buf.code_action()
                end, opts)
            end,
        })

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "phpactor", "clangd" },
            handlers = {
                function(server_name)
                    local lspconfig = require("lspconfig")

                    lspconfig.lua_ls.setup({
                        on_init = function(client)
                            lsp_zero.nvim_lua_settings(client, {})
                        end,
                    })

                    lspconfig.phpactor.setup({})
                    lspconfig.clangd.setup({})
                end,
            }
        })

        local cmp = require('cmp')

        cmp.setup({
            sources = {
                { name = 'nvim_lsp' },
            },
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({}),
        })
    end
}
