local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})

vim.keymap.set('n', '<leader>d', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>i', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>r', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>p', builtin.diagnostics, {})

vim.cmd[[
nnoremap <leader>g <cmd>Telescope live_grep<cr>
]]

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevelstart = 99



