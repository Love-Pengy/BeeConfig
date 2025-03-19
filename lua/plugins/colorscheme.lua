
return {
  "RedsXDD/neopywal.nvim",
  priority = 1000, 
  config = function()
    require("neopywal").setup({
      transparent_background = true 
    })
    vim.cmd.colorscheme("neopywal")
  end,
}

-- return {
--   "love-pengy/lillilac.nvim",
--   priority = 1000, 
--   config = function()
--     vim.cmd.colorscheme("lillilac")
--   end,
-- }

--testing
--[[
return {
    dir = "/home/Bee/Projects/lillilac.nvim/",
    opts = { lazy = true },
    config = function(opts)
        vim.cmd.colorscheme("lillilac")
    end,
}
]]
--


--[[
return {
  'liuchengxu/space-vim-theme',
  config = function(opts)
    vim.cmd("set background=light")
    vim.cmd.colorscheme("space_vim_theme")
  end,
}
--]]
