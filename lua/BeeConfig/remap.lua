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


--a little encouragement
vim.keymap.set("n", '<Left>', ':echoe "Use h"<CR>')
vim.keymap.set("n", '<Right>', ':echoe "Use l"<CR>')
vim.keymap.set("n", '<Up>', ':echoe "Use k"<CR>')
vim.keymap.set("n", '<Down>', ':echoe "Use j"<CR>')
vim.keymap.set("i", '<Left>' , '<ESC>:echoe "Use h"<CR>')
vim.keymap.set("i", '<Right>' , '<ESC>:echoe "Use l"<CR>')
vim.keymap.set("i", '<Up>' , '<ESC>:echoe "Use k"<CR>')
vim.keymap.set("i", '<Down>' , '<ESC>:echoe "Use j"<CR>')


--buffer (im finna use these as tabs) keybinds
vim.keymap.set("n", '<leader>t', ':enew<CR>')
vim.keymap.set("n", '<leader>d', ':bd<CR>')
vim.keymap.set("n", '<leader><Tab>', ':bnext<CR>')
vim.keymap.set("n", '<leader><S-Tab>', ':bprev<CR>')


--inverse tab in insert mode
vim.keymap.set("i", '<S-Tab>', '<C-d>')
--tabs in visual mode
vim.keymap.set("v", '<S-Tab>', '<<') 
vim.keymap.set("v", '<Tab>', '>>') 

