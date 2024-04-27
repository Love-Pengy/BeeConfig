return {
    {
        --plugin for gettins language servers 
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        --abstracts some of the mason installs away from us 
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls", "clangd"},
                automatic_installation = true,
            })
        end
    },

    {
        --makes lsp and client talk to each other (they're best friends :3)
        "neovim/nvim-lspconfig",
        config = function()

            local lspconfig = require('lspconfig')

            vim.diagnostic.config({
                virtual_text = true,
                signs = {
                    error = '✘',
                    warn = '▲',
                    hint = '⚑',
                    info = '»'
                },
                underline = false,
                update_in_insert = false,
                severity_sort = true,
            })
            --[[
            vim.diagnostic.set_sign_icons({
                    error = '✘',
                warn = '▲',
                hint = '⚑',
                info = '»'
            })
--]]
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

            lspconfig.lua_ls.setup({})
            lspconfig.clangd.setup({
                filetypes = {"c", "h", "cpp"},
                cmd = {"clangd"},
                single_file_support = true,
                root_dir = lspconfig.util.find_node_modules_ancestor
            })

        end
    },

    {
        "nvim-telescope/telescope-ui-select.nvim",
            config = function()
                require("telescope").setup {
                    extensions = {
                        ["ui-select"] = {
                            require("telescope.themes").get_dropdown {
                            }
                        }
                    }
                }
                require("telescope").load_extension("ui-select")
            end
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                --diagnostics = linter
                --formatting = formatter
                sources = {
                    --lua 
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.diagnostics.selene,  
                    --c
                    null_ls.builtins.formatting.clang_format,
                    --cant find
                    null_ls.builtins.diagnostics.gccdiag,
                    --python
                    null_ls.builtins.formatting.isort,
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.diagnostics.pylint,  
                },
            })
            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

        end
    }
}


