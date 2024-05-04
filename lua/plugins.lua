return {
	{
		{
			--BMO!!
			{
				"Love-Pengy/minintro.nvim",
				opts = { color = "#63bda4" },
				config = true,
				lazy = false,
			},
			{
				"iamcco/markdown-preview.nvim",
				cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
				ft = { "markdown" },
				build = function()
					vim.fn["mkdp#util#install"]()
				end,
			},

			--automatic highlight disabling when done with search
			"romainl/vim-cool",

			--colorscheme maker
			{
				"rktjmp/lush.nvim",
				cmd = "Lushify",
			},

			--get good scrub
			{
				"ThePrimeagen/vim-be-good",
				cmd = "VimBeGood",
			},
		},
	},
}
