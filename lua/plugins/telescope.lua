return {
    'nvim-telescope/telescope.nvim', 
    opts = {
        version = '0.1.4',
    }, 
    config = function(opts)

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
    end, 
}
