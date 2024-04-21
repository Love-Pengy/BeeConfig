return {

    'VonHeikemen/lsp-zero.nvim',
    opt = {branch = 'v3.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
            {'hrsh7th/cmp-buffer'}, 
            {'hrsh7th/cmp-path'}, 
            {'saadparwaiz1/cmp_luasnip'}, 
            {'hrsh7th/cmp-nvim-lua'}, 
            {'rafamadriz/friendly-snippets'}, 
        }
    }, 

    config = function(opt)
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            local opts = {buffer = bufnr, remap = false}

            vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)

        end)

        require('mason').setup({})
        require('mason-lspconfig').setup({
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
                {name = 'luasnip', keyword_length = 3},
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
    end, 
}
