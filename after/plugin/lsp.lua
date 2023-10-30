local lsp_zero = require('lsp-zero')


lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'ruff_lsp', 'clangd', 'marksman'}, 
	handlers = {
		lsp_zero.default_setup,
	}, 
})


