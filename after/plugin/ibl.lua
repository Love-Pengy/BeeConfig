--[[
--vim.cmd [[highlight IndentBlanklineIndent1 guifg=#101022 guibg=#101022 gui=nocombine
--vim.cmd [[highlight IndentBlanklineIndent2 guifg=#101022 guibg=#101023 gui=nocombine
--vim.cmd [[highlight IndentBlanklineIndent3 guifg=#101022 guibg=#101024 gui=nocombine

require("ibl").setup {
    indent = { highlight  = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
                --this is a test
    }, char = "▎"},
    whitespace = {
    highlight = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
    }, remove_blankline_trail = false},
}



local highlight = {
    "RainbowOne", 
    "RainbowTwo", 
    "RainbowThree", 
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowOne", { fg = "#101022", bg = "#101022" })
    vim.api.nvim_set_hl(0, "RainbowTwo", { fg = "#101022", bg = "#101023" })
    vim.api.nvim_set_hl(0, "RainbowThree", { fg = "#101022", bg = "#101024" })
end)

require("ibl").setup { indent = { highlight = highlight } }
--]]

local highlight = {
    "Color1",
    "Color2",
    "Color3",
    "Color4",
    "Color5",
}

local highlight2 = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    --"RainbowOrange",
    "RainbowViolet",
    "RainbowCyan",
    "RainbowPink",
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
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#0ACDFF" })
    -- vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    --vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#2C0E37" })
    --vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    --vim.api.nvim_set_hl(0, "RainbowPink", { fg = "#FF66B3" })
end)

--vim.g.rainbow_delimiters = {highlight = highlight2} 
require("ibl").setup { indent = { highlight = highlight }, scope = { enabled = false}}

--hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
