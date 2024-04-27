return {
    {
        {

            --BMO!!
            {
                "Love-Pengy/minintro.nvim",
                opts = { color = "#63bda4" }, 
                config = true,
                lazy = false
            }, 

            --markdown plugin
            {
                "iamcco/markdown-preview.nvim",
                cmd = "MarkdownPreview" 
            }, 

            --file/project searching 
            {
                'nvim-telescope/telescope.nvim', 
                dependencies = {'nvim-lua/plenary.nvim', 'sharkdp/fd'}
            }, 

            --automatic highlight disabling when done with search 
            'romainl/vim-cool', 

            --colorscheme maker
            {
                'rktjmp/lush.nvim', 
                cmd = "Lushify"
            }, 

            --get good scrub 
            {
                'ThePrimeagen/vim-be-good', 
                cmd = "VimBeGood"
            }, 

            --my colorscheme
            'Love-Pengy/SunflowerBee', 

            --syntax tree 
            {
                'nvim-treesitter/nvim-treesitter', 
                build = ':TSUpdate' 
            },

            {
                'akinsho/bufferline.nvim',
                dependencies = 'nvim-tree/nvim-web-devicons'
            }, 

            --undo plugin
            ('mbbill/undotree'), 

            --pretty delimiters 
            {
                'lukas-reineke/indent-blankline.nvim',
                dependencies = 'HiPhish/rainbow-delimiters.nvim', 
            }, 
            
        }

    }
}
