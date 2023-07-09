local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	return
end

local lsp_status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not lsp_status_ok then
	return
end

mason.setup()

mason_lsp.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"rust_analyzer",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = false, -- not the same as ensure_installed
})

