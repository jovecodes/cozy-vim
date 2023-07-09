return {
	-- { "~/Code/Scripts/simprunner", dev = true },
	-- Colors
	"sainnhe/gruvbox-material",

	-- Filetree
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		module = "neo-tree",
		cmd = "Neotree",
		dependencies = { { "MunifTanjim/nui.nvim", module = "nui" }, "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.configs.neo-tree")
		end,
	},

	-- Telescope
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim" },
	{ "ibhagwan/fzf-lua" },

	-- Commenting
	{
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.configs.comment")
		end,
	},

	{
		'eddyekofo94/gruvbox-flat.nvim',
		priority = 1000,
		enabled = true,
		config = function()
			-- vim.g.gruvbox_italic_functions = true
			vim.g.gruvbox_flat_style = "dark"
			vim.cmd([[colorscheme gruvbox-flat]])
		end,
	},
	-- Bufferlines
	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("plugins.configs.bufferline")
	-- 	end,
	-- },
	-- { "moll/vim-bbye" },
	-- {
	-- 	"tiagovla/scope.nvim",
	-- 	config = true,
	-- },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.configs.treesitter")
		end,
	},

	-- Status line 
	{
		'nvim-lualine/lualine.nvim',
		config = function()
			require("plugins.configs.lualine")
		end,
	},

	-- indent guides for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			char = "│",
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
	},

	-- toggleterm
	{
		"akinsho/toggleterm.nvim",
	},

	-- Auto completions
	{ "hrsh7th/cmp-buffer" }, -- buffer completions
	{ "hrsh7th/cmp-path" }, -- path completions
	{ "hrsh7th/cmp-cmdline" }, -- cmdline completions
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-emoji" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ 'hrsh7th/cmp-vsnip' },
	{ 'hrsh7th/vim-vsnip' },
	{ "ray-x/lsp_signature.nvim" },
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.configs.cmp")
		end,
	},

	-- Snippets
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" },

	-- Manage and Install LSP servers
	{ "williamboman/mason-lspconfig" },
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins.configs.lsp.mason")
		end,
	},

	-- Lsp
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lsp.lspconfig")
		end,
	},

	-- Impatient optimize the startup time
	{ "lewis6991/impatient.nvim" },

	-- Rust
	{ "simrat39/rust-tools.nvim" },
	-- { "Saecki/crates.nvim" },

	-- Git
	{ "tpope/vim-fugitive" },

	-- Transparent backround 
	-- { "xiyaowong/nvim-transparent" },

	-- session management
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
		-- stylua: ignore
		keys = {
			{ "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
			{ "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
			{ "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
		},
	},

	{ "nvim-lua/plenary.nvim", lazy = true },
}

