local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end
--
-- local lspkind_status_ok, lspkind = pcall(require, "lspkind")
-- if not lspkind_status_ok then
-- 	return
-- end

require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup({
	-- Enable LSP snippets
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		['<C-k>'] = cmp.mapping.select_prev_item(),
		['<C-j>'] = cmp.mapping.select_next_item(),
		['<C-s>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-c>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<C-f>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		})
	},
	-- Installed sources:
	sources = {
		{ name = 'path' },                              -- file paths
		{ name = 'nvim_lsp' },      -- from language server
		{ name = 'nvim_lsp_signature_help' },           -- display function signatures with current parameter emphasized
		{ name = 'nvim_lua' },      -- complete neovim's Lua runtime API such vim.lsp.*
		{ name = 'buffer' },        -- source current buffer
		{ name = 'vsnip' },         -- nvim-cmp source for vim-vsnip 
		{ name = "crates" },
		{ name = 'calc' },                              -- source for math calculation
		{ name = "emoji" },
		{ name = "cmp_tabnine" },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})

