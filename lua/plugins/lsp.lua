return {
  'williamboman/mason.nvim', 
  config = function(opts)

    local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
        numhl = hl,
      })
    end

    vim.diagnostic.config({
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
