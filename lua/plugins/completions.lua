return {
  --[[
	{
		--displays completions from the lsp attached to buffer
		"hrsh7th/cmp-nvim-lsp",
		--source for everything in the current buffer
		"hrsh7th/cmp-buffer",
		--source for the vim command line
		"hrsh7th/cmp-cmdline",
		--supplies cmp with path completions
		"hrsh7th/cmp-path",
	},
	{
		--snippet engine (snippets are the recommendations you get based off of previous code)
		"L3MON4D3/LuaSnip",
		dependencies = {
			--luasnip completion source (connects luasnip with cmp)
			"saadparwaiz1/cmp_luasnip",
			--collection of snippets from languages
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
				}),

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "path", keyword_length = 3 },
					{ name = "buffer" },
				}),
			})
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path", keyword_length = 3 },
				}, {
					{ name = "cmdline", keyword_length = 3 },
				}),
				matching = { disallow_symbol_nonprefix_matching = false },
			})
		end,
	},
  ]]--
}
