_G.Config = {}

Config.diagnostic_signs = {
	ERROR = "󰅙",
	WARNING = "",
	HINT = "󰌵",
	INFO = "󰋼",
}

local gr = vim.api.nvim_create_augroup("my-config", {})
Config.new_autocmd = function(event, pattern, callback, desc)
	local opts = { group = gr, pattern = pattern, callback = callback, desc = desc }
	vim.api.nvim_create_autocmd(event, opts)
end

require("config.lazy")
