local lsp_zero = require('lsp-zero')

<<<<<<< HEAD

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({buffer = bufnr})
=======
lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)

>>>>>>> 60f4d09 (fixes and autocompletion setup)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
<<<<<<< HEAD
	ensure_installed = {'ruff_lsp', 'clangd', 'marksman'}, 
	handlers = {
		lsp_zero.default_setup,
	}, 
})


=======
  automatic_installation = true, 
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  window = {
                completion = cmp.config.window.bordered(), 
                documentation = cmp.config.window.bordered(),
        }, 
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})
>>>>>>> 60f4d09 (fixes and autocompletion setup)
