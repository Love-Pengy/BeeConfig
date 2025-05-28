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

vim.lsp.enable('cpplint')
vim.lsp.enable('clangd')

require("BeeConfig")
