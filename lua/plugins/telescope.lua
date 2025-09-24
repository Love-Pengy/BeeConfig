return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "sharkdp/fd" },
    config = function()
        vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<CR>", {})
        vim.keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<CR>", {})
        vim.keymap.set("n", "<leader>pg", "<cmd>Telescope git_files<CR>", {})
    end,
}
