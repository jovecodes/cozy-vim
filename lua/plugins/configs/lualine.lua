local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	vim.notify("lualine not found")
	return
end

lualine.setup({
    sections = {
        lualine_x = { "overseer" },
    },
})
