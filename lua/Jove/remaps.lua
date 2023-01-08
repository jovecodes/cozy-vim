vim.g.mapleader = " "
vim.keymap.set("i", "<C-q>", "<Esc>")
vim.cmd[[
nnoremap <leader>gg :Telescope live_grep <CR>
]]
vim.keymap.set("n", "q", "")
vim.keymap.set("n", "<F1>", "")
