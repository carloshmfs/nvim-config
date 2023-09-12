vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- file explorer
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- colorscheme theme
    use ({
        'patstockwell/vim-monokai-tasty',
        config = function()
            vim.cmd('colorscheme vim-monokai-tasty')
        end
    })
end)
