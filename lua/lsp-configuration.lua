-- extensions for nvim-lspconfig configurations
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim' },
            },
        }
    }
})

vim.lsp.config('pylsp', {
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile",
        ".venv" },
    settings     = {
        pylsp = {
            plugins = {
                -- Linter options
                pycodestyle = {
                    maxLineLength = 100
                },
            }
        }
    }
})
