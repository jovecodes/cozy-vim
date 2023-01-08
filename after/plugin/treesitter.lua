require 'nvim-treesitter.install'.prefer_git = false
require 'nvim-treesitter.install'.compilers = { "clang", "cargo" }
-- Treesitter Plugin Setup 
require('nvim-treesitter.configs').setup {
    ensure_installed = { "help", "javascript", "c", "lua", "rust" },
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
  
