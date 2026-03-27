return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup({
			ensure_installed = {
				"lua",
				"luadoc",
				"vim",
				"vimdoc",
				"c",
				"cpp",
				"fish",
				"zig",
				"rust",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "TSUpdate",
			callback = function()
				require("nvim-treesitter.parsers").sourcepawn = {
					---@diagnostic disable-next-line missing-fields
					install_info = {
						url = "https://github.com/nilshelmig/tree-sitter-sourcepawn",
						files = { "src/parser.c", "src/scanner.c" },
						branch = "main",
						generate_requires_npm = false,
						requires_generate_from_grammar = false,
					},
					filetype = "sp",
				}
			end,
		})
	end,
}
