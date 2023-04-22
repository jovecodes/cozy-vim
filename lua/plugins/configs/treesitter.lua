
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

vim.filetype.add({extension = {wgsl = "wgsl"}})

require 'nvim-treesitter.install'.compilers = { "g++", "gcc", "cargo" }

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.wgsl = {
    install_info = {
        url = "https://github.com/szebniok/tree-sitter-wgsl",
        files = {"src/parser.c"}
    },
}

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	-- ensure these language parsers are installed
	ensure_installed = {
		"html",
		"css",
		-- "markdown",
		"lua",
		"vim",
		"rust",
		"toml",
        "c",
        "cpp",
	},
	-- auto install above language parsers
	auto_install = false,
})
