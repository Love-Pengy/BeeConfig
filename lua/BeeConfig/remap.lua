vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "y", "\"+y")
vim.keymap.set("v", "y", "\"+y")
vim.keymap.set("n", "y", "\"+Y")

vim.keymap.set("n", "d", "\"_d")
vim.keymap.set("v", "d", "\"_d")

vim.keymap.set("n", '<Left>', ':echoe "Use h"<CR>')
vim.keymap.set("n", '<Right>', ':echoe "Use l"<CR>')
vim.keymap.set("n", '<Up>', ':echoe "Use k"<CR>')
vim.keymap.set("n", '<Down>', ':echoe "Use j"<CR>')
vim.keymap.set("i", '<Left>' , '<ESC>:echoe "Use h"<CR>')
vim.keymap.set("i", '<Right>' , '<ESC>:echoe "Use l"<CR>')
vim.keymap.set("i", '<Up>' , '<ESC>:echoe "Use k"<CR>')
vim.keymap.set("i", '<Down>' , '<ESC>:echoe "Use j"<CR>')

[[--
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR> 
--]]
