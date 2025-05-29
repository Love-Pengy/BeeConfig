-- load this before the plugins
vim.opt.termguicolors = true

vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      }
    }
  },
  root_markers = { '.git' },
})

vim.lsp.enable('clangd')
vim.lsp.enable('luals')

require("BeeConfig")
