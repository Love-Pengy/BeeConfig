-- return {
--   -- Baes2Tone_MallDark, Base2Tone_PorchDark
--   "atelierbram/Base2Tone-vim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("Base2Tone_PorchDark")
--     vim.api.nvim_set_hl(0, "CursorLineNr", {fg = "#f2e3f7"})
--   end,
-- }
return {
  "thesimonho/kanagawa-paper.nvim",
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme("kanagawa-paper-ink")
  end,
  opts = {},
}
