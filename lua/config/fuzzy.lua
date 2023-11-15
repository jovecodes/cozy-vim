--[[ fuzzy.lua
-- $ figlet -f fuzzy theovim
--  .-. .-.                      _
-- .' `.: :                     :_;
-- `. .': `-.  .--.  .--. .-..-..-.,-.,-.,-.
--  : : : .. :' '_.'' .; :: `; :: :: ,. ,. :
--  :_; :_;:_;`.__.'`.__.'`.__.':_;:_;:_;:_;
--
-- Set up fuzzy finder plug-in. Currerntly Telescope.nvim
--]]
--

local util = require("util")

local telescope = require("telescope")
local builtin = require('telescope.builtin')

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
            },
        },
        path_display = { "smart" },
        file_ignore_patterns = {
            ".git/",
            "target/",
            "extern/",
            "cmake%-build%-debug/",
            "cmake%-build%-release/",
            "cmake%-build%-web/",
            "bin/",
            "docs/",
            "vendor/*",
            "%.lock",
            "__pycache__/*",
            "%.sqlite3",
            "%.ipynb",
            "node_modules/*",
            -- "%.o",
            "%.jpg",
            "%.jpeg",
            "%.png",
            "%.svg",
            "%.otf",
            "%.ttf",
            "%.webp",
            ".dart_tool/",
            ".github/",
            ".gradle/",
            ".idea/",
            ".settings/",
            ".vscode/",
            "__pycache__/",
            "build/",
            "env/",
            "gradle/",
            "node_modules/",
            "%.pdb",
            "%.dll",
            "%.class",
            "%.exe",
            "%.cache",
            "%.ico",
            "%.pdf",
            "%.dylib",
            "%.jar",
            "%.docx",
            "%.met",
            "smalljre_*/*",
            ".vale/",
            "%.burp",
            "%.mp4",
            "%.mkv",
            "%.rar",
            "%.zip",
            "%.7z",
            "%.tar",
            "%.bz2",
            "%.epub",
            "%.flac",
            "%.tar.gz",
        },
    },
    extensions = {},
})

-- Load file browser extension AFTER telescope is initialized
-- telescope.load_extension("file_browser")

-- Keymaps
vim.keymap.set('n', "<leader>b", function() builtin.buffers() end,
    { noremap = true, silent = true, desc = "[b]uffer: open the buffer list" })
vim.keymap.set('n', "<leader>p", function() builtin.registers() end,
    { noremap = true, silent = true, desc = "[p]aste: choose from registers" })
vim.keymap.set('n', "<leader>?", function() builtin.keymaps() end,
    { noremap = true, silent = true, desc = "[?]help: open keymap fuzzy finder" })
vim.keymap.set('n', "<leader>f", function() builtin.find_files() end,
    { noremap = true, silent = true, desc = "[f]uzzy [f]iles: open file fuzzy finder" })
vim.keymap.set('n', "<leader>of", function() builtin.oldfiles() end,
    { noremap = true, silent = true, desc = "[f]uzzy [r]ecent: open recent file fuzzy finder" })
vim.keymap.set('n', "<leader>cg", function() builtin.current_buffer_fuzzy_find() end,
    { noremap = true, silent = true, desc = "[f]uzzy [/]search: open current buffer fuzzy finder" })

vim.keymap.set('n', '<leader>ld', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>li', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>lr', builtin.lsp_references, {})


vim.cmd [[
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>td :TodoTelescope<cr>
]]

-- Custom menu
local telescope_options = {
    ["1. Search History"] = function() builtin.search_history() end,
    ["2. Command History"] = function() builtin.command_history() end,
    ["3. Commands"] = function() builtin.commands() end,
    ["4. Help Tags"] = function() builtin.help_tags() end,
    ["5. Colorscheme"] = function() builtin.colorscheme() end,
}
local telescope_menu = util.create_select_menu("Telescope option to launch:", telescope_options)
vim.keymap.set('n', "<leader>af", telescope_menu,
    { noremap = true, silent = true, desc = "[f]uzzy [a]ction: open menu for Telescope features" })
