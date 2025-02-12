function color(color)
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })

    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NvimTreeNormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "TelescopePreviewLine", { fg = "#f0df29", bg = "#7da3f0", bold = true })
end

color("rose-pine")
