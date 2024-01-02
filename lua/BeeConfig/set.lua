--put numbers on the side
vim.cmd("set number")

--enabkle colored line on cursor 
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

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

--brings the text up or when hitting 8 above or below the top or bottom 
vim.opt.scrolloff = 8

--enable cursor to go one more char in normal mode
vim.cmd("set ve+=onemore")

--turn off the mouse
vim.opt.mouse = ""

--colorscheme fixing 
vim.cmd("set numberwidth=1")

	
