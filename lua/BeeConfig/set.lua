--put numbers on the side
vim.cmd("set number")
vim.cmd("set relativenumber")

--make the time to accept a command to 500 ms instead of 1000 for mappings
vim.cmd("set updatetime=500")

--enable colored line on cursor
vim.cmd("set cursorline")

--will try to be smart about when tabbing so will use multuple if needed
vim.cmd("set smarttab")

--automatically indent in functions and what not
vim.cmd("set autoindent")

--set tabs to 4 spaces no matter what
vim.opt.tabstop = 4 --amount of spaces for normal tabs
vim.opt.shiftwidth = 4 -- spaces for when using << or >>
vim.opt.expandtab = true -- pressing tab key will insert spaces instead of tab character

--self explainatory
vim.opt.smartindent = true

--dont wrap text
vim.opt.wrap = false

-- gives me the chunky cursor in insert mode
vim.opt.guicursor = ""

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

--highlight current search
vim.opt.hlsearch = true

--show search while typing it
vim.opt.incsearch = true

--24 bit color (required for a bunch of plugins)
vim.opt.termguicolors = true

--brings the text up or when hitting 10 above or below the top or bottom
vim.opt.scrolloff = 10

--enable cursor to go one more char in normal mode
vim.cmd("set ve+=onemore")

--turn off the mouse
vim.opt.mouse = ""

--colorscheme fixing
vim.cmd("set numberwidth=1")

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
