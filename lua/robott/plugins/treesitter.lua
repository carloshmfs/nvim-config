return {
    "nvim-treesitter/nvim-treesitter",
    branch = 'main',
    build = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
    config = function()
        vim.api.nvim_create_autocmd('FileType', {
            callback = function ()
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end
        })

        local ensureInstalled = {
            "c", "cpp", "javascript", "lua", "vim", "vimdoc", "query", "php", "html" 
        }
        local alreadyInstalled = require('nvim-treesitter.config').get_installed()
        local parsersToInstall = vim.iter(ensureInstalled)
        :filter(function(parser)
            return not vim.tbl_contains(alreadyInstalled, parser)
        end)
        :totable()
        require('nvim-treesitter').install(parsersToInstall)
    end
}
