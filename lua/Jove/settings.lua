vim.cmd[[
colorscheme gruvbox
set number
syntax on
set clipboard+=unnamedplus
set hidden

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"
]]
