return {
  {
    {
      --BMO!!
      {
        "Love-Pengy/minintro.nvim",
        opts = { color = "#63bda4" },
        config = true,
        lazy = false,
        enabled = false,
      },
      {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        enabled = false,
        build = function()
          vim.fn["mkdp#util#install"]()
        end,
      },

      --automatic highlight disabling when done with search
      "romainl/vim-cool",

      --colorscheme maker
      {
        "rktjmp/lush.nvim",
        dependencies = {
          --colorscheme exporter
          "rktjmp/shipwright.nvim",
        },
        cmd = "Lushify",
        enabled = false,
      },

    },
  },
}
