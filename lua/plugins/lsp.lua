return {
    {
        --plugin for gettins language servers
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        --abstracts some of the mason installs away from us
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd" },
                automatic_installation = true,
            })
        end,
    },
    {
        --makes lsp and client talk to each other (they're best friends :3)
        "neovim/nvim-lspconfig",
        config = function()
            --function for changing icons on the left side of screen https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
            local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
            end

            local lspconfig = require("lspconfig")
            vim.diagnostic.config({
                virtual_text = {
                    prefix = "󰻀",
                },
                underline = false,
                update_in_insert = false,
                severity_sort = true,
            })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

            lspconfig.lua_ls.setup({})
            lspconfig.clangd.setup({
                filetypes = { "c", "h", "cpp" },
                cmd = { "clangd", "--background-index" },
                single_file_support = true,
                root_dir = lspconfig.util.root_pattern(
                    ".clangd",
                    ".clang-tidy",
                    ".clang-format",
                    "compile_commands.json",
                    "compile_flags.txt",
                    "configure.ac",
                    ".git"
                ),
            })
        end,
    },
    {
        --gives pretty ui to code actions
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
    {
        --manages linters and formatters
        "nvimtools/none-ls.nvim",
        dependencies = {
            --lets me use cpplint
            "nvimtools/none-ls-extras.nvim",
        },
        config = function()
            local null_ls = require("null-ls")
            --https://youtu.be/lsFoZIg-oDs?si=SKp4zZV3yiECWfJb
            local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
            null_ls.setup({
                --diagnostics = linter
                --formatting = formatter
                sources = {
                    --lua
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.diagnostics.selene,
                    --c
                    null_ls.builtins.formatting.clang_format,
                    require("none-ls.diagnostics.cpplint"),
                    --python
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.diagnostics.pylint,
                },
                --check we're in file that supports formatting and get rid of already
                --running formatters
                on_attach = function(client, bufnr)
                    if client.supports_method("textDocument/formatting") then
                        vim.api.nvim_clear_autocmds({
                            group = augroup,
                            buffer = bufnr,
                        })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end,
                        })
                    end
                end,
            })
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end,
    },
}
