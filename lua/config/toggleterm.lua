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
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

vim.cmd [[
autocmd BufWinEnter,WinEnter term://* startinsert
]]

local run_command = ""
local build_jov_filename = "build.jov.sh"

local function findBuildJovFile()
    local maxAttempts = 3
    local currentDirectory = "./"

    for attempt = 1, maxAttempts do
        local filePath = currentDirectory .. build_jov_filename
        local file = io.open(filePath, "r")

        if file then
            return currentDirectory .. "build.jov.sh"
        end

        currentDirectory = currentDirectory .. "../"
    end

    return nil -- File not found after maximum attempts
end

local function createAndWriteToFile(filename, content)
    local file = io.open(filename, "w")

    if file then
        vim.cmd("silent e " .. filename)
        vim.cmd("silent !chmod +x " .. filename)
        return true -- File created and written successfully
    else
        vim.notify('Error creating build file', 'error')
        return false -- Failed to create or write to the file
    end
end

function StoreLine()
    local should_store = vim.fn.input('Create new build file?: ')

    if should_store == 'y' then
        createAndWriteToFile(build_jov_filename, run_command)
    end
end

function Run()
    local jov_cmd = findBuildJovFile()
    if jov_cmd then
        run_command = jov_cmd
    end

    if run_command == "" then
        StoreLine()
    else
        vim.cmd("TermExec cmd='" .. run_command .. "'")
    end
end

vim.cmd [[
nnoremap <F6> :lua StoreLine()<CR>
noremap <leader>r :lua Run()<CR>
]]
