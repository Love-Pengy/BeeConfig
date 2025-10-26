return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "lua_ls", "clangd", "pylsp",
            "cssls", "bashls", "yamlls", "harper_ls" }
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
