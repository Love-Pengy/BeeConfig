--make leader space
vim.g.mapleader = " "

--open netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- FIXME: this doesn't work for multiple lines in certain cases atm 

--when using these binds you can move a chunk of text and it will automatically 
--indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--makes search terms stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", '"+y')

--allows paste without removing current buffer
vim.keymap.set("x", "<leader>p", '"_dP')

--allows ci without removing current paste buffer
vim.keymap.set("n", "ci(", '"_ci(')
vim.keymap.set("n", "ci)", '"_ci)')
vim.keymap.set("n", "ci{", '"_ci{')
vim.keymap.set("n", "ci}", '"_ci}')
vim.keymap.set("n", "ci'", "\"_ci'")
vim.keymap.set("n", "ci[", '"_ci[')
vim.keymap.set("n", "ci]", '"_ci]')
vim.keymap.set("n", 'ci"', '"_ci"')

--allows use of d without copying
vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')

--buffer (im finna use these as tabs) keybinds
vim.keymap.set("n", "<leader>t", ":bnew<CR>")
vim.keymap.set("n", "<leader>d", "<cmd>bd<CR>")
vim.keymap.set("n", "<leader><Tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<leader><S-Tab>", "<cmd>bprev<CR>")


vim.keymap.set('n', 'gh', vim.lsp.buf.signature_help)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
vim.keymap.set('n', 'go', vim.lsp.buf.type_definition)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help)
vim.keymap.set('n', 'gr', vim.lsp.buf.rename)
vim.keymap.set({ 'n', 'x' }, 'gf', vim.lsp.buf.format)
vim.keymap.set('n', 'ga', vim.lsp.buf.code_action)
