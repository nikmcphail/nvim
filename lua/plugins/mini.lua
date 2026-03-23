return {
	"nvim-mini/mini.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local misc = require("mini.misc")
		-- Set colorscheme
		vim.cmd.colorscheme("miniwinter")

		-- Common configuration presets.
		require("mini.basics").setup({
			options = { basic = false },
			mappings = {
				windows = true,
				move_with_alt = true,
			},
		})

		-- Icon provider.
		local ext3_blocklist = { scm = true, txt = true, yml = true }
		local ext4_blocklist = { json = true, yaml = true }
		require("mini.icons").setup({
			use_file_extension = function(ext, _)
				return not (ext3_blocklist[ext:sub(-3)] or ext4_blocklist[ext:sub(-4)])
			end,
		})

		-- Mock 'nvim-tree/nvim-web-devicons' for plugins without 'mini.icons' support.
		misc.safely("later", MiniIcons.mock_nvim_web_devicons)

		-- Add LSP kind icons.
		misc.safely("later", MiniIcons.tweak_lsp_kind)

		-- Notifications provider
		require("mini.notify").setup()

		-- Start screen.
		require("mini.starter").setup()

		-- Statusline.
		require("mini.statusline").setup()

		-- Tabline.
		require("mini.tabline").setup()

		-- Navigate and manipulate file system.
		require("mini.files").setup()
		local add_marks = function()
			MiniFiles.set_bookmark("c", vim.fn.stdpath("config"), { desc = "Config" })
			MiniFiles.set_bookmark("w", vim.fn.getcwd, { desc = "Working directory" })
		end
		Config.new_autocmd("User", "MiniFilesExplorerOpen", add_marks, "Add bookmarks")

		-- Various setup functions.
		misc.setup()

		-- Change current working directory based on the current file path.
		MiniMisc.setup_auto_root()

		-- Restore latest cursor position in file open
		MiniMisc.setup_restore_cursor()

		-- Synchronize terminal emulator background with Neovim's background to remove
		-- possibly different color padding around Neovim instanc
		MiniMisc.setup_termbg_sync()

		-- Extra 'mini.nvim' functionality
		require("mini.extra").setup()

		-- Better around and inside text objects.
		local ai = require("mini.ai")
		ai.setup({
			custom_textobjects = {
				B = MiniExtra.gen_ai_spec.buffer(),
				F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
			},

			search_method = "cover",
		})

		-- Various [ and ] based key combos.
		require("mini.bracketed").setup()

		-- Delete buffers.
		require("mini.bufremove").setup()

		-- Key combo clues.
		local clue = require("mini.clue")
		clue.setup({
			clues = {
				Config.leader_group_clues,
				clue.gen_clues.builtin_completion(),
				clue.gen_clues.g(),
				clue.gen_clues.marks(),
				clue.gen_clues.registers(),
				clue.gen_clues.square_brackets(),
				clue.gen_clues.windows({ submode_resize = true }),
				clue.gen_clues.z(),
			},
			triggers = {
				{ mode = { "n", "x" }, keys = "<Leader>" }, -- Leader triggers
				{ mode = "n", keys = "\\" }, -- mini.basics
				{ mode = { "n", "x" }, keys = "[" }, -- mini.bracketed
				{ mode = { "n", "x" }, keys = "]" },
				{ mode = "i", keys = "<C-x>" }, -- Built-in completion
				{ mode = { "n", "x" }, keys = "g" }, -- `g` key
				{ mode = { "n", "x" }, keys = "'" }, -- Marks
				{ mode = { "n", "x" }, keys = "`" },
				{ mode = { "n", "x" }, keys = '"' }, -- Registers
				{ mode = { "i", "c" }, keys = "<C-r>" },
				{ mode = "n", keys = "<C-w>" }, -- Window commands
				{ mode = { "n", "x" }, keys = "s" }, -- `s` key (mini.surround, etc.)
				{ mode = { "n", "x" }, keys = "z" }, -- `z` key
			},
		})

		-- Autopairs.
		require("mini.pairs").setup({ modes = { command = true } })

		-- Comment lines
		require("mini.comment").setup()

		-- Autohighlight word under cursor.
		require("mini.cursorword").setup()

		-- Highlight patterns in text.
		local hipatterns = require("mini.hipatterns")
		local hi_words = MiniExtra.gen_highlighter.words
		hipatterns.setup({
			highlighters = {
				-- Highlight a fixed set of common words. Will be highlighted in any place,
				-- not like "only in comments".
				fixme = hi_words({ "FIXME", "Fixme", "fixme" }, "MiniHipatternsFixme"),
				hack = hi_words({ "HACK", "Hack", "hack" }, "MiniHipatternsHack"),
				todo = hi_words({ "TODO", "Todo", "todo" }, "MiniHipatternsTodo"),
				note = hi_words({ "NOTE", "Note", "note" }, "MiniHipatternsNote"),

				-- Highlight hex color string (#aabbcc) with that color as a background
				hex_color = hipatterns.gen_highlighter.hex_color(),
			},
		})

		-- Indent scope.
		require("mini.indentscope").setup()

		-- Mini map.
		local map = require("mini.map")
		map.setup({
			symbols = { encode = map.gen_encode_symbols.dot("4x2") },
			integrations = {
				map.gen_integration.builtin_search(),
				map.gen_integration.diff(),
				map.gen_integration.diagnostic(),
			},
		})

		-- Move any selection in any direction.
		require("mini.move").setup()

		-- Picker.
		require("mini.pick").setup()

		-- Surround actions.
		require("mini.surround").setup()
	end,
}
