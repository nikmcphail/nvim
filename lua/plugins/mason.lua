return {
	"mason-org/mason.nvim",
	lazy = true,
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "󰄬",
					package_pending = "󱦰",
					package_uninstalled = "",
				},
				border = "single",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"lua-language-server",
				"stylua",
			},
			auto_update = true,
			run_on_start = true,
			start_delay = 3000,
			debounce_hours = 5,
		})
	end,
}
