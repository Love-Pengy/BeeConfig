local opt = vim.opt

--put numbers on the side
opt.number = true
opt.relativenumber = true

--make the time to accept a command to 500 ms instead of 1000 for mappings
opt.updatetime = 500

-- time to wait for a keybind to complete 
opt.timeoutlen = 500

--enable colored line on cursor (needed for deadcolumn)
opt.cursorline = true
opt.colorcolumn = "80";

--will try to be smart about when tabbing so will use multuple if needed
opt.smarttab = true

--automatically indent in functions and what not
opt.autoindent = true
opt.smartindent = true

--set tabs to 2 spaces no matter what
opt.tabstop = 2 --amount of spaces for normal tabs
opt.shiftwidth = 2 -- spaces for when using << or >>
opt.expandtab = true -- pressing tab key will insert spaces instead of tab character

--dont wrap text
opt.wrap = false

-- gives me the chunky cursor in insert mode
opt.guicursor = ""

opt.swapfile = false

-- make a backup before overwritting file
opt.backup = true
vim.opt_global.backupdir = "/tmp/nvimTmp/backupdir"
opt.backupcopy = "auto"

-- hold undos into a file for persistance 
opt.undofile = true
opt.undodir = "/tmp/nvimTmp/undodir"

--highlight current search
opt.hlsearch = true

--show search while typing it
opt.incsearch = true

--brings the text up or when hitting 10 above or below the top or bottom
opt.scrolloff = 10

--colorscheme fixing
vim.cmd("set numberwidth=1")

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Show Whitespace
vim.opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Sync Clipboards
vim.o.clipboard = 'unnamedplus'

-- Set Signs
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✘", 
      [vim.diagnostic.severity.WARN] = "▲", 
      [vim.diagnostic.severity.HINT] = "⚑",
      [vim.diagnostic.severity.INFO] = " ", 
    },
  },
  virtual_text = {
    prefix = "󰻀",
  },
  underline = false,
  update_in_insert = true,
  severity_sort = true,
})

