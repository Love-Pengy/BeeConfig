return {
  'williamboman/mason.nvim', 

  config = function(opts)

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "✘", 
          [vim.diagnostic.severity.WARN] = "▲", 
          [vim.diagnostic.severity.HINT] = "⚑",
          [vim.diagnostic.severity.INFO] = " ", 
        },
      },
      virtual_text = {
        prefix = "󰻀",
      },
      underline = false,
      update_in_insert = true,
      severity_sort = true,
    })

    require('mason').setup({})

  end,
}
