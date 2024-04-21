return {

'lukas-reineke/indent-blankline.nvim',
opt = {main = "ibl", opts={}}, 
config = function(opt)

local highlight = {
    "Color1",
    "Color2",
    "Color3",
    "Color4",
    "Color5",
}

local sunflowerDelims = {
        "Sunflower1", 
        "Sunflower2", 
        "Sunflower3", 
        "Sunflower4", 
        "Sunflower5", 
}


local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "Color1", { fg = "#91C4F2" })
    vim.api.nvim_set_hl(0, "Color2", { fg = "#8CA0D7" })
    vim.api.nvim_set_hl(0, "Color3", { fg = "#9D79BC" })
    vim.api.nvim_set_hl(0, "Color4", { fg = "#A14DA0" })
    vim.api.nvim_set_hl(0, "Color5", { fg = "#7E1F86" })
    vim.api.nvim_set_hl(0, "Sunflower1", { fg = "#FBCA47" })
    vim.api.nvim_set_hl(0, "Sunflower2", { fg = "#FBEB62" })
    vim.api.nvim_set_hl(0, "Sunflower3", { fg = "#DE6D11" })
    vim.api.nvim_set_hl(0, "Sunflower4", { fg = "#CF6B13" })
    vim.api.nvim_set_hl(0, "Sunflower5", { fg = "#F69F22" })
end)

vim.g.rainbow_delimiters = {highlight = sunflowerDelims} 
require("ibl").setup( { indent = { highlight = highlight }, scope = { highlight = sunflowerDelims, show_start = false, show_end = false}})

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end, 
}
