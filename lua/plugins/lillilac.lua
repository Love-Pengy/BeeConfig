return {
	--dir = "/home/Bee/Projects/LilLilacLush",
	"love-pengy/lillilac.nvim",
	opts = { lazy = true },
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
