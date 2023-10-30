require("BeeConfig")
--require('plugins')
require("nvim-treesitter.install").prefer_git = true 
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'python', 'lua', 'python', 'vimdoc', 'vim' },
  }

