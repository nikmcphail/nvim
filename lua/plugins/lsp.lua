return {
	"mason-org/mason-lspconfig.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"neovim/nvim-lspconfig",
		"saghen/blink.cmp",
	},
	config = function()
		require("mason-lspconfig").setup({
			automatic_enable = true,
		})

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = {
								"vim",
								"require",
								"Config",
							},
						},
					},
				},
			},
			rust_analyzer = {},
			zls = {},
		}

		for server, config in pairs(servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)

			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end

		local diagnostics = {
			underline = true,
			update_in_insert = false,
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = "",
			},
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = Config.diagnostic_signs.ERROR,
					[vim.diagnostic.severity.WARN] = Config.diagnostic_signs.WARNING,
					[vim.diagnostic.severity.HINT] = Config.diagnostic_signs.HINT,
					[vim.diagnostic.severity.INFO] = Config.diagnostic_signs.INFO,
				},
			},
			inlay_hints = {
				enabled = true,
			},
			folds = {
				enabled = true,
			},
		}
		vim.diagnostic.config(diagnostics)
	end,
}
