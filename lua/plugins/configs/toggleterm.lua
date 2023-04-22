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

local Terminal = require("toggleterm.terminal").Terminal

local cargo_test = Terminal:new({ cmd = "cargo test | tail -f", hidden = false })
local cargo_run = Terminal:new({ cmd = "cargo run | tail -f", hidden = false })

function _CARGO_RUN()
	cargo_run:toggle()
end

vim.api.nvim_set_keymap('n', '<leader>r', ':ToggleTerm<CR>cargo run<CR>', { noremap = true, silent = true })

function _CARGO_TEST()
	cargo_test:toggle()
end

vim.api.nvim_set_keymap('n', '<leader>ct', ':lua _CARGO_RUN()<CR>', { noremap = true, silent = true })
