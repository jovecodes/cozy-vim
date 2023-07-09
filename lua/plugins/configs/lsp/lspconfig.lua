local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status_ok then
	return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig["rust_analyzer"].setup({
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                allFeatures = true,
                overrideCommand = {
                    'cargo', 'clippy', 'fmt', '--workspace', '--message-format=json',
                    '--all-targets', '--all-features'
                }
            }
        }
    },
	cmd = {
		"rustup",
		"run",
		"stable",
		"rust-analyzer",
	},
    capabilities = capabilities
})

lspconfig["wgsl_analyzer"].setup({})

lspconfig["zls"].setup({})

lspconfig["ocamllsp"].setup({})

lspconfig["clangd"].setup {
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders"
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true
  },
  flags = { debounce_text_changes = 150 }
}

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
	settings = { -- custom settings for lua
		Lua = {
			-- make the language server recognize "vim" global
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				-- make language server aware of runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
    capabilities = capabilities
})

-- configure rust_analyzer server
local rt_status_ok, rt = pcall(require, "rust-tools")
if not rt_status_ok then
	print("no rust-tools")
	return
end

local rust_opts = {
	server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<leader>h", rt.hover_actions.hover_actions, { buffer = bufnr })
            vim.keymap.set("i", "<C-h>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            vim.keymap.set("i", "<C-a>", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
		cmd = {
			"rustup",
			"run",
			"stable",
			"rust-analyzer",
		},
		settings = {
			["rust-analyzer"] = {
				diagnostics = {
					experimental = true,
				},
			},
		},
	},
}

rt.setup(rust_opts)
