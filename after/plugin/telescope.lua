local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('i', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.git_files, {})
vim.keymap.set('n', '<leader>gw', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.cmd[[
nnoremap <leader>gg :Telescope live_grep <CR>
]]
