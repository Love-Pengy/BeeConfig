return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    local kanagawa_paper = require("lualine.themes.kanagawa-paper-ink")
    require('lualine').setup({
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'searchcount', 'selectioncount', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      options = {
        separator = nil,
        section_separators = '',
        component_separators = '',
        theme = kanagawa_paper,
      },
    })
  end,
}
