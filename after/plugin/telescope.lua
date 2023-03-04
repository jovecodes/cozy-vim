local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('i', '<C-f>', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>gw', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>d', builtin.diagnostics, {})

vim.cmd[[
nnoremap <leader>gg :Telescope live_grep <CR>
]]

require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            'target/*', 
            '%.png', 
            '%.bmp', 
            '%.jpeg', 
            '%.aseprite',
            '%.lock',
            '%.dll',
        },
    }
}
