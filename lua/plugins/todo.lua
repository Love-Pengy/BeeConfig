return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    vim.keymap.set("n", "<leader>tn", function()
      require("todo-comments").jump_next()
    end, { desc = "Next Todo Comment" }),
    vim.keymap.set("n", "<leader>tp", function()
      require("todo-comments").jump_prev()
    end, { desc = "Previous Todo Comment" }),
    vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<CR>",
      { desc = "Open Todo List In Telescope" })
  },
}
