vim.filetype.add({extension = {wgsl = "wgsl"}})

require 'nvim-treesitter.install'.compilers = { "clang", "cargo" }

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.wgsl = {
    install_info = {
        url = "https://github.com/szebniok/tree-sitter-wgsl",
        files = {"src/parser.c"}
    },
}
-- Treesitter Plugin Setup 
require('nvim-treesitter.configs').setup {
    ensure_installed = { "help", "javascript", "c", "lua", "rust", "wgsl" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting=false,
    },
    ident = { enable = true }, 
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}
 
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 99  
