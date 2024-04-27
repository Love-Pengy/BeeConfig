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
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            lspconfig.lua_ls.setup({})
            lspconfig.clangd.setup({
                filetypes = {"c", "h", "cpp"},
                cmd = {"clangd"},
                single_file_support = true,
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

    }

