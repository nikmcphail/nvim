return {
	"mason-org/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = Config.mason_signs.INSTALLED,
					package_pending = Config.mason_signs.PENDING,
					package_uninstalled = Config.mason_signs.UNINSTALLED,
				},
				border = "single",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"rust-analyzer",
				"zls",
				"fish-lsp",
			},
			auto_update = true,
			run_on_start = true,
			auto_install = true,
			start_delay = 3000,
			debounce_hours = 5,
		})
	end,
}
