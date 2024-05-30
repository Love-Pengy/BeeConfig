return {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    event = "VeryLazy",
    { "MunifTanjim/nui.nvim" },
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                background_colour = "#000000",
                timeout = 1500,
                render = "compact",
                stages = "fade",
            })
        end,
    },
    {
        "folke/noice.nvim",
        opts = {
            event = "VeryLazy",
        },
        config = function(opts)
            --im lazy
            vim.opt.termguicolors = true
            require("noice").setup({
                routes = {
                    {
                        view = "notify",
                        filter = { event = "msg_showmode" },
                    },
                },
                views = {
                    notify = {
                        replace = true,
                    },
                },
                lsp = {
                    progress = {
                        enabled = true,
                        view = "notify",
                    },
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                cmdline = {
                    enabled = true,
                    view = "cmdline",
                },
                hover = {
                    enabled = false,
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = false, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true, -- add a border to hover docs and signature help
                },
            })
        end,
    },
}
