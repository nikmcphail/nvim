return {
	"saghen/blink.cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	version = "1.*",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
		},
		{
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	opts = {
		keymap = {
			preset = "default",
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			list = {
				selection = {
					preselect = false,
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
				window = {
					border = "single",
				},
			},
			menu = {
				border = "single",
				scrollbar = false,
			},
			ghost_text = {
				enabled = false,
			},
		},
		snippets = { preset = "luasnip" },
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
		signature = {
			enabled = true,
		},
		fuzzy = {
			implementation = "prefer_rust_with_warning",
		},
		cmdline = {
			completion = {
				menu = {
					auto_show = true,
				},
			},
		},
	},
	opts_extend = { "sources.default" },
}
