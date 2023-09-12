function setColorScheme(color)
    color = color or "vim-monokai-tasty"

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

setColorScheme()
