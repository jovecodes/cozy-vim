local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})

vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})

vim.cmd[[
nnoremap <leader>gg :Telescope live_grep <CR>
]]

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 99

vim.keymap.set('n', 'K', '')
vim.keymap.set('v', 'K', '')


