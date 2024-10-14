return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },

  config = function()
    -- Inneficiency speed run fr
    local custom_auto = require("lualine.themes.auto")
		custom_auto.normal.c.fg = "#ffffff"
		custom_auto.insert.c.fg = "#ffffff"
		custom_auto.visual.c.fg = "#ffffff"
		custom_auto.replace.c.fg = "#ffffff"
		custom_auto.command.c.fg = "#ffffff"
		custom_auto.inactive.c.fg = "#ffffff"
		custom_auto.normal.b.fg = "#ffffff"
		custom_auto.insert.b.fg = "#ffffff"
		custom_auto.visual.b.fg = "#ffffff"
		custom_auto.replace.b.fg = "#ffffff"
		custom_auto.command.b.fg = "#ffffff"
		custom_auto.inactive.b.fg = "#ffffff"

		custom_auto.normal.a.bg = "#8e6ea6"
		custom_auto.insert.a.bg = "#b657ff "
		custom_auto.visual.a.bg = "#e3bdff"
		custom_auto.replace.a.bg = "#ffa8f8"
		custom_auto.command.a.bg = "#ff4df0"
		custom_auto.inactive.a.bg = "#9e99ff"

		custom_auto.normal.b.bg = nil
		custom_auto.normal.c.bg = nil
		custom_auto.insert.b.bg = nil
		custom_auto.insert.c.bg = nil
		custom_auto.visual.b.bg = nil
		custom_auto.visual.c.bg = nil
		custom_auto.replace.b.bg = nil
		custom_auto.replace.c.bg = nil
		custom_auto.command.b.bg = nil
		custom_auto.command.c.bg = nil
		custom_auto.inactive.b.bg = nil
		custom_auto.inactive.c.bg = nil
    


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
        theme = custom_auto,
      },
    })
  end,
}
