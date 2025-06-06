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

        local sunflowerDelims = {
            "Sunflower1",
            "Sunflower2",
            "Sunflower3",
            "Sunflower4",
            "Sunflower5",
        }

        local hooks = require("ibl.hooks")
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            -- vim.api.nvim_set_hl(0, "Color1", { fg = "#674573" })
            -- vim.api.nvim_set_hl(0, "Color3", { fg = "#6981c5" })
            -- vim.api.nvim_set_hl(0, "Color4", { fg = "#a15ea7" })
            vim.api.nvim_set_hl(0, "Sunflower1", { fg = "#FBCA47" })
            vim.api.nvim_set_hl(0, "Sunflower2", { fg = "#FBEB62" })
            vim.api.nvim_set_hl(0, "Sunflower3", { fg = "#DE6D11" })
            vim.api.nvim_set_hl(0, "Sunflower4", { fg = "#CF6B13" })
            vim.api.nvim_set_hl(0, "Sunflower5", { fg = "#F69F22" })
        end)

        vim.g.rainbow_delimiters = { highlight = sunflowerDelims }
        require("ibl").setup({
            -- indent = { highlight = highlight },
            scope = { highlight = sunflowerDelims, show_start = false, show_end = false },
        })

        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
}
