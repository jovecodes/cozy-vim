--[[ plugins.lua
-- $ figlet -f rectangles theovim
--  _   _               _
-- | |_| |_ ___ ___ _ _|_|_____
-- |  _|   | -_| . | | | |     |
-- |_| |_|_|___|___|\_/|_|_|_|_|
--
-- This file does:
--   - Initialize the list of plug-ins to be installed
--   - Bootstrap Lazy plugin manager and install plug-ins
--   - Initialize plug-ins using eacch setup() function
--   - For some plug-ins, provide a small configuration work in `config`
--     This is limited to basic config, and extensive config for some plug-ins will be done elsewhere
--   - For some plug-ins, install external dependencies
--]]


-- Plug-in list
local plugins = {
    -- dependencies
    { "nvim-lua/plenary.nvim", },       --> Lua function library for Neovim (used by Telescope)
    { "nvim-tree/nvim-web-devicons", }, --> Icons for barbar, Telescope, and more

    -- Games
    "ThePrimeagen/vim-be-good",

    -- UI
    {
        "folke/tokyonight.nvim", --> colorscheme
    },
    {
        'eddyekofo94/gruvbox-flat.nvim',
        config = function()
            vim.cmd([[
            try
            colo gruvbox-flat
            catch
            colo slate
            endtry
            ]])
        end,
    },
    -- { "ellisonleao/gruvbox.nvim" },

    {
        "rcarriga/nvim-notify", --> Prettier notification
        config = function() vim.notify = require("notify") end,
    },

    -- Syntax, file, search
    { "nvim-treesitter/nvim-treesitter", }, --> Incremental highlighting
    {
        "nvim-telescope/telescope.nvim",    --> Expandable fuzzy finer
        -- ! Latest version to support Neovim 0.8
        -- Will be updated in the future Theovim release
        version = "0.1.1",
    },

    {
        "stevearc/oil.nvim", --> Manage files like Vim buffer; currently testing!
        config = function()
            require("oil").setup()
            vim.cmd("nnoremap <silent> <leader>v :Oil<CR>")
        end,
    },
    -- {
    --     "lewis6991/gitsigns.nvim", --> Git information
    --     config = function() require("gitsigns").setup() end,
    -- },
    {
        "windwp/nvim-autopairs", --> Autopair
        event = "VeryLazy",
        config = function() require("nvim-autopairs").setup() end,
    },
    {
        "numToStr/Comment.nvim",
    },
    {
        "norcalli/nvim-colorizer.lua", --> Color highlighter
        config = function() require("colorizer").setup() end,
    },

    -- LSP
    {
        "williamboman/mason.nvim", --> LSP Manager
        config = function() require("mason").setup() end,
    },
    { "neovim/nvim-lspconfig", },                                                   --> Neovim defult LSP engine
    { "williamboman/mason-lspconfig.nvim", },                                       --> Bridge between Mason and lspconfig
    { "theopn/friendly-snippets", },                                                --> VS Code style snippet collection
    {
        "L3MON4D3/LuaSnip",                                                         --> Snippet engine that accepts VS Code style snippets
        config = function() require("luasnip.loaders.from_vscode").lazy_load() end, --> Load snippets from friendly snippets
    },
    { "saadparwaiz1/cmp_luasnip", },                                                --> nvim_cmp and LuaSnip bridge
    { "hrsh7th/cmp-nvim-lsp", },                                                    --> nvim-cmp source for LSP engine
    { "hrsh7th/cmp-buffer", },                                                      --> nvim-cmp source for buffer words
    { "hrsh7th/cmp-path", },                                                        --> nvim-cmp source for file path
    { "hrsh7th/cmp-cmdline", },                                                     --> nvim-cmp source for :commands
    { "hrsh7th/cmp-nvim-lua" },                                                     --> nvim-cmp source for Neovim API
    { "hrsh7th/nvim-cmp", },                                                        --> Completion Engine

    -- Debugging
    -- {
    --     "mfussenegger/nvim-dap",
    -- },
    -- {
    --     "rcarriga/nvim-dap-ui",
    --     event = "VeryLazy",
    --     dependencies = "mfussenegger/nvim-dap",
    --     config = function()
    --         local dap = require("dap")
    --         local dapui = require("dapui")
    --
    --         dapui.setup()
    --         dap.listeners.after.event_initialized["dapui_config"] = function()
    --             dapui.open()
    --         end
    --         dap.listeners.before.event_terminated["dapui_config"] = function()
    --             dapui.close()
    --         end
    --         dap.listeners.before.event_exited["dapui_config"] = function()
    --             dapui.close()
    --         end
    --     end
    -- },
    -- {
    --     "jay-babu/mason-nvim-dap.nvim",
    --     event = "VeryLazy",
    --     dependencies = {
    --         "williamboman/mason.nvim",
    --         "mfussenegger/nvim-dap",
    --     },
    --     opts = {
    --         handlers = {}
    --     },
    -- },
    --
    -- Text editing
    {
        "iamcco/markdown-preview.nvim",                       --> MarkdownPreview to toggle
        build = function() vim.fn["mkdp#util#install"]() end, --> Binary installation for markdown-preview
        ft = { "markdown" },
    },
    {
        "lervag/vimtex", --> LaTeX integration
        config = function() vim.g.tex_flavor = "latex" end,
        ft = { "plaintex", "tex" },
    },

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        event = "VeryLazy",
    },

    -- TODOs
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },

    -- Persistence
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
        -- stylua: ignore
        keys = {
            { "<leader>ls", function() require("persistence").load() end,                desc = "Restore Session" },
            { "<leader>ll", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
            -- {
            --     "<leader>ld",
            --     function() require("persistence").stop() end,
            --     desc =
            --     "Don't Save Current Session",
            -- },
        },
    },

    {
        "luukvbaal/statuscol.nvim",
        config = function()
            -- local builtin = require("statuscol.builtin")
            require("statuscol").setup()
        end,
    },
}

--- {{{ Lazy.nvim installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins)
--- }}}
