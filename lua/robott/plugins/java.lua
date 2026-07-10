return {
    "https://codeberg.org/mfussenegger/nvim-jdtls.git",
    config = function ()
        vim.lsp.enable("jdtls")
    end
}
