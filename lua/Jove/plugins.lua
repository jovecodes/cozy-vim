-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')


return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Colorschemes
    use 'sainnhe/gruvbox-material'
    use 'morhetz/gruvbox'
    use 'xiyaowong/nvim-transparent'

    -- Its in the name
    use('mbbill/undotree')
    -- Git
    use('tpope/vim-fugitive')

    -- LSP
    use 'williamboman/mason.nvim'    
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig' 
    use 'simrat39/rust-tools.nvim'

    -- Debugging
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'
    use("folke/zen-mode.nvim")

    -- Completion framework:
    use 'hrsh7th/nvim-cmp' 

    -- LSP completion source:
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources:
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/vim-vsnip'

    -- Syntax Highlighting
    use 'nvim-treesitter/nvim-treesitter'

    -- Filetree
    use 'nvim-tree/nvim-web-devicons'
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use {"akinsho/toggleterm.nvim", tag = '*' }


    use 'lukas-reineke/indent-blankline.nvim'
    use 'numToStr/Comment.nvim'
    use 'preservim/tagbar'
    use 'folke/trouble.nvim'
end)
