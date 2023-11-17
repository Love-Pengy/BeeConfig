vim.cmd("set number")
vim.cmd("set autoindent")
vim.cmd("set smarttab")

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.guicursor = ""

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

--vim.cmd("hi StatusLine  guifg=NONE")

