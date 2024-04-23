return {
    'nvim-telescope/telescope.nvim', 
    opts = {
        version = '0.1.4',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    }, 
    config = function(opts)
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end, 
}
