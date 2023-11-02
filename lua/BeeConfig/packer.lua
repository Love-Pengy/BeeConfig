-- only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


use {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use {'ray-x/starry.nvim', setup = function() 
	-- see example setup below
	vim.g.starry_italic_comments = true
	vim.cmd("colorscheme middlenight_blue")
end}

use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
use('mbbill/undotree')
use('tpope/vim-fugitive')
use('williamboman/mason.nvim')
use('williamboman/mason-lspconfig.nvim')
use('neovim/nvim-lspconfig')
use "lukas-reineke/indent-blankline.nvim"
--[[
use {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		opts = {}
		-- Other blankline configuration here
		require("ibl").setup(require("indent-rainbowline").make_opts(opts), {
              -- How transparent should the rainbow colors be. 1 is completely opaque, 0 is invisible. 0.07 by default
	color_transparency = 0.15,
	-- The 24-bit colors to mix with the background. Specified in hex.
	-- { 0xffff40, 0x79ff79, 0xff79ff, 0x4fecec, } by default
	colors = { 0xff0000, 0x00ff00, 0x0000ff, }, } )
	end,
	requires = {
		"TheGLander/indent-rainbowline.nvim",
	},
}
--]]
 
use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  requires = {
    --- Uncomment these if you want to manage LSP servers from neovim
    -- {'williamboman/mason.nvim'},
    -- {'williamboman/mason-lspconfig.nvim'},

    -- LSP Support
    {'neovim/nvim-lspconfig'},
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'L3MON4D3/LuaSnip'},
  }
}

end)
