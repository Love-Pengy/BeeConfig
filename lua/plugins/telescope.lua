return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "sharkdp/fd" },
    config = function()
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", "<cmd>Telescope find_files no_ignore=true<CR>", {})
        vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
    end,
}
