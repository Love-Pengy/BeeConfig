return {
	"love-pengy/lillilac.nvim",
	config = function(opts)
		vim.cmd.colorscheme("lillilac")
	end,
}

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
>>>>>>> 6354426 (up)
return {
  'liuchengxu/space-vim-theme',
  config = function(opts)
    vim.cmd("set background=light")
    vim.cmd.colorscheme("space_vim_theme")
  end,
}
--]]
