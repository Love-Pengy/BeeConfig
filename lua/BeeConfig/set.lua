local opt = vim.opt
--put numbers on the side
opt.number = true
opt.relativenumber = true

--make the time to accept a command to 500 ms instead of 1000 for mappings
opt.updatetime = 100

-- time to wait for a keybind to complete 
opt.timeoutlen = 500

--enable colored line on cursor
opt.cursorline = true

--will try to be smart about when tabbing so will use multuple if needed
opt.smarttab = true

--automatically indent in functions and what not
opt.autoindent = true

--set tabs to 4 spaces no matter what
opt.tabstop = 4 --amount of spaces for normal tabs
opt.shiftwidth = 4 -- spaces for when using << or >>
opt.expandtab = true -- pressing tab key will insert spaces instead of tab character

--self explainatory
opt.smartindent = true

--dont wrap text
opt.wrap = false

-- gives me the chunky cursor in insert mode
opt.guicursor = ""

opt.swapfile = false
-- make a backup before overwritting file
opt.backup = true
vim.opt_global.backupdir = os.getenv("HOME") .. "/.nvimTmp/backupdir"
opt.backupcopy = "auto"

-- hold undos into a file for persistance 
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.nvimTmp/undodir"

--highlight current search
opt.hlsearch = true

--show search while typing it
opt.incsearch = true

--24 bit color (required for a bunch of plugins)
opt.termguicolors = true

--brings the text up or when hitting 10 above or below the top or bottom
opt.scrolloff = 10

--enable cursor to go one more char in normal mode
vim.cmd("set ve+=onemore")

--turn off the mouse
--opt.mouse = ""

--colorscheme fixing
vim.cmd("set numberwidth=1")

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- mouse pointer is hidden when characters are typed
opt.mousehide = true

-- highlight matching brace
opt.showmatch = true

-- command line height (status line still stays)
opt.cmdheight = 0;


