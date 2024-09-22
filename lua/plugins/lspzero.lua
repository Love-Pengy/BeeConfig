return {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { "L3MON4D3/LuaSnip" },
    { 'hrsh7th/nvim-cmp' },
    { "rafamadriz/friendly-snippets" },
  },
  config = function(opts)
    ---
    -- LSP setup
    ---
    local lsp_zero = require('lsp-zero')

    -- lsp_attach is where you enable features that only work
    -- if there is a language server active in the file
    local lsp_attach = function(client, bufnr)
      local opts = { buffer = bufnr }

      vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
      vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
      vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
      vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
      vim.keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      vim.keymap.set({ 'n', 'x' }, '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
      vim.keymap.set('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end

    local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = hl,
      })
    end

    vim.diagnostic.config({
      virtual_text = {
        prefix = "󰻀",
      },
      underline = false,
      update_in_insert = true,
      severity_sort = true,
    })

    lsp_zero.extend_lspconfig({
      sign_text = true,
      lsp_attach = lsp_attach,
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })

    require('mason').setup({})
    require('mason-lspconfig').setup({
      -- allows us to install through mason and not worry about it after that
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,
      }
    })

    ---
    -- Autocompletion config
    ---
    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()
    local cmp_format = require('lsp-zero').cmp_format({ details = true })
    require("luasnip.loaders.from_vscode").lazy_load()
    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'luasnip' },
        { name = 'path',    keyword_length = 5 },
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-y>'] = cmp.mapping.confirm({ select = false }),

        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-n>'] = cmp_action.luasnip_jump_forward(),
        ['<C-p>'] = cmp_action.luasnip_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
      }),
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body)
        end,
      },
      formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
          local menu_icon = {
            nvim_lsp = 'λ',
            luasnip = '⋗',
            buffer = 'Ω',
            path = '🖫',
            nvim_lua = 'Π',
          }

          item.menu = menu_icon[entry.source.name]
          return item
        end,
      },
    })
  end
}
