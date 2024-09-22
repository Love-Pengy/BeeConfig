return {
    --pretty indent bars
    "lukas-reineke/indent-blankline.nvim",
    dependencies = "HiPhish/rainbow-delimiters.nvim",
    opts = { main = "ibl", opts = {}, event = "UIEnter" },

    config = function(opts)
        local highlight = {
            "Color1",
            "Color2",
            "Color3",
            "Color4",
            "Color5",
            "Color6", 
        }

        local hooks = require("ibl.hooks")
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "Color1", { fg = "#d26487" })
            vim.api.nvim_set_hl(0, "Color2", { fg = "#35a8a5" })
            vim.api.nvim_set_hl(0, "Color3", { fg = "#6981c5" })
            vim.api.nvim_set_hl(0, "Color4", { fg = "#a15ea7" })
            vim.api.nvim_set_hl(0, "Color5", { fg = "#288668" })
            vim.api.nvim_set_hl(0, "Color6", { fg = "#ca754b" })
        end)

        vim.g.rainbow_delimiters = { highlight = sunflowerDelims }
        require("ibl").setup({
            indent = { highlight = highlight },
            scope = { highlight = sunflowerDelims, show_start = false, show_end = false },
        })

        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
}
