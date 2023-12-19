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
        --file/project searching 
         {
          'nvim-telescope/telescope.nvim', version = '0.1.4',
          dependencies = { {'nvim-lua/plenary.nvim'} }
        },

    --telescope search helper
    'sharkdp/fd', 
	
	--colorscheme maker
	'rktjmp/lush.nvim', 
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
          }
        } 

}

}
require("lazy").setup(plugins, {})
