
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/AppData/Local/nvim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'morhetz/gruvbox'
Plug('folke/tokyonight.nvim', { branch = 'main' })

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn['treesitter#TSUpdate']})
Plug 'akinsho/toggleterm.nvim'

Plug 'neoclide/coc.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'numToStr/Comment.nvim'

vim.call('plug#end')
