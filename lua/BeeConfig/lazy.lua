--package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

local plugins = {
	{
        --markdown plugin
        {
            "iamcco/markdown-preview.nvim",
            cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
            ft = { "markdown" },
            build = function() vim.fn["mkdp#util#install"]() end,
        }, 

        --file/project searching 
         {
          'nvim-telescope/telescope.nvim', version = '0.1.4',
          dependencies = { {'nvim-lua/plenary.nvim'} }
        },


    --discord rich presence
    {
      "jiriks74/presence.nvim",
      event = "UIEnter",
    },

    --telescope search helper
    'sharkdp/fd', 
	
    --open obsidian from within neovim (I made this!!:3)
    'Love-Pengy/obsidianOpener.nvim',  
    
    --automatic highlight disabling when done with search 
    'romainl/vim-cool', 

	--colorscheme maker
	'rktjmp/lush.nvim', 
    
    --smoove move   
    --[[
    {
      'declancm/cinnamon.nvim',
      config = function() require('cinnamon').setup({
            default_delay = .25, 
            hide_cursor = true,
            }) end
    }, 
    ]]
    --get good scrub 
    'ThePrimeagen/vim-be-good', 
	--my colorscheme
	'Love-Pengy/SunflowerBee', 

        --syntax tree 
        'nvim-treesitter/nvim-treesitter', 
        build = ':TSUpdate', 
        --undo plugin
        ('mbbill/undotree'), 
        --git functionality 
        ('tpope/vim-fugitive'), 
        --pretty indents
	    {'lukas-reineke/indent-blankline.nvim', main = "ibl", opts={}}, 
        --lsp plugins 
        ('williamboman/mason.nvim'), 
        ('williamboman/mason-lspconfig.nvim'), 
        ('neovim/nvim-lspconfig'), 

        --pretty status line
        ("MunifTanjim/nougat.nvim"), 
        --bufferline
         {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'}, 
        --pretty delimiters 
        'HiPhish/rainbow-delimiters.nvim', 
        --lsp-zero setup
         {
          'VonHeikemen/lsp-zero.nvim',
          branch = 'v3.x',
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
        } 

}

}

require("lazy").setup(plugins, {})
