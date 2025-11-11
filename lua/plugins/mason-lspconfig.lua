return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = {
            -- Lua
            "lua_ls",
            -- C/Cpp
            "clangd",
            -- python
            "pylsp",
            -- html/css
            "cssls",
            -- bash
            "bashls",
            -- yaml
            "yamlls",
            -- comments
            "harper_ls",
            -- markdown
            "marksman" }
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
