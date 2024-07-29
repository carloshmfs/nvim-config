return {
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    config = function()
        require('glow').setup({
            style = 'dark',
            width = 120,
            border = 'single',
            pager = false
        })
    end
}

