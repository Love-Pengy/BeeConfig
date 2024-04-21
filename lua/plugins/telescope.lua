return {
    'nvim-telescope/telescope.nvim', 
    opt = {
        version = '0.1.4',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    }, 
    config = function(opt)
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end, 
}
