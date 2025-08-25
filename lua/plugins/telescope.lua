return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "sharkdp/fd" },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<CR>", {})
        vim.keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<CR>", {})
    end,
}
