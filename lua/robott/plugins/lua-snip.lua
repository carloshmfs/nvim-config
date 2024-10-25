return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function ()
        local ls = require("luasnip")
        local s = ls.snippet
        local sn = ls.snippet_node
        local t = ls.text_node
        local i = ls.insert_node

        vim.keymap.set("i", "<c-k>", function ()
            if ls.expand_or_jumpable() then
                ls.expand_or_jump()
            end
        end)

        ls.add_snippets("html", {
            s("trigger", {})
        })
    end
}
