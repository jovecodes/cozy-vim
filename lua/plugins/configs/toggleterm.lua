local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<C-t>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",

	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

function _G.set_terminal_keymaps()
	local opts = {noremap = true}
	vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

vim.cmd[[
autocmd BufWinEnter,WinEnter term://* startinsert
]]

-- Define a function to be executed when the filetype matches
function RustCommands()
	vim.api.nvim_set_keymap('n', '<leader>r', ':ToggleTerm<CR>cargo run<CR>', { noremap = true, silent = true })
end

function CCommands()
	vim.api.nvim_set_keymap('n', '<leader>r', ':ToggleTerm<CR>make<CR>', { noremap = true, silent = true })
end

function ZigCommands()
	vim.api.nvim_set_keymap('n', '<leader>r', ':ToggleTerm<CR>zig build run<CR>', { noremap = true, silent = true })
end

-- Define an autocmd event that triggers when the filetype is detected
vim.cmd([[
    augroup FiletypeAutocmds
    autocmd!
    autocmd FileType rs lua RustCommands()
    autocmd FileType c lua CCommands()
    autocmd FileType cpp lua CCommands()
    autocmd FileType zig lua ZigCommands()
    augroup END
]])
