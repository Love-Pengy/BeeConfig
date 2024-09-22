return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        separator = nil,
        section_separators = '',
        component_separators = '',
        theme = "onelight",
      }, 
    })
  end,
}
