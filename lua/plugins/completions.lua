return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        --displays completions from the lsp attached to buffer
        'hrsh7th/cmp-nvim-lsp',
        --snippet engine (snippets are the recommendations you get based off of previous code)
        'L3MON4D3/LuaSnip',
        --luasnip completion source (connects luasnip with cmp)
        'saadparwaiz1/cmp_luasnip',
        --source for everything in the current buffer
        'hrsh7th/cmp-buffer',
        --source for the vim command line
        'hrsh7th/cmp-cmdline',
        --supplies cmp with path completions
        'hrsh7th/cmp-path',
        --collection of snippets from languages 
        'rafamadriz/friendly-snippets',
    },

    config = function()
        local cmp = require('cmp')
        cmp.setup({
            snippet = {
              -- REQUIRED - you must specify a snippet engine
              expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
              end,
            },
            window = {
              completion = cmp.config.window.bordered(),
              documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),

            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              --{ name = 'vsnip' }, -- For vsnip users.
              { name = 'luasnip' }, -- For luasnip users.
              -- { name = 'ultisnips' }, -- For ultisnips users.
              -- { name = 'snippy' }, -- For snippy users.
            }, {
              { name = 'buffer' },
            })
        })

    end,


}
