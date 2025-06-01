return {
  "fedepujol/move.nvim",
  config = function()
    require('move').setup({
      line = {
        enable = false, -- Enables line movement
        indent = false  -- Toggles indentation
      },
      block = {
        enable = true, -- Enables block movement
        indent = true  -- Toggles indentation
      },
      word = {
        enable = false, -- Enables word movement
      },
      char = {
        enable = false -- Enables char movement
      }
    })

    local opts = { noremap = true, silent = true }
    -- Visual-mode commands
    vim.keymap.set('v', 'J', ':MoveBlock(1)<CR>', opts)
    vim.keymap.set('v', 'K', ':MoveBlock(-1)<CR>', opts)
  end
}
