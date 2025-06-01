--make leader space
vim.g.mapleader = " "

--open netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--makes search terms stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--copy to system clipboard
-- vim.keymap.set({"n", "v"}, "<leader>y", '"+y')

--allows paste without removing current buffer
vim.keymap.set("x", "<leader>p", '"_dP')

--allows use of d without copying
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')

--buffer (im finna use these as tabs) keybinds
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>")
vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>")
