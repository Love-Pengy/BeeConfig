--[[
return {
	--dir = "/home/Bee/Projects/LilLilacLush",
	"love-pengy/lillilac.nvim",
	opts = { lazy = true },
	config = function(opts)
		vim.cmd.colorscheme("lillilac")
	end,
}
  ]] --
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
--
--
return {
  'liuchengxu/space-vim-theme',
  config = function(opts)
    vim.cmd("set background=light")
    vim.cmd.colorscheme("space_vim_theme")
  end,
}
