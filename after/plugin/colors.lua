function color(color)
    color = color or "gruvbox"
    if color == "monokai-pro" then
        require("monokai-pro").setup({
            filter = "spectrum"
        })
    end

    vim.cmd.colorscheme(color)
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

color("monokai-pro")
