local nmap = function(lhs, rhs, desc)
	vim.keymap.set("n", lhs, rhs, { desc = desc })
end

local nmap_leader = function(lhs, rhs, desc)
	vim.keymap.set("n", "<Leader>" .. lhs, rhs, { desc = desc })
end
local xmap_leader = function(lhs, rhs, desc)
	vim.keymap.set("x", "<Leader>" .. lhs, rhs, { desc = desc })
end

Config.leader_group_clues = {
	{ mode = "n", keys = "<Leader>b", desc = "+Buffer" },
	{ mode = "n", keys = "<Leader>f", desc = "+Find" },
	{ mode = "n", keys = "<Leader>l", desc = "+Language" },
	{ mode = "n", keys = "<Leader>m", desc = "+Map" },
	{ mode = "n", keys = "<Leader>g", desc = "+Git" },

	{ mode = "x", keys = "<Leader>l", desc = "+Language" },
	{ mode = "x", keys = "<Leader>g", desc = "+Git" },
}

-- Paste linewise before/after current line
nmap("[p", '<cmd>exe "iput! " . v:register<cr>', "Paste above")
nmap("]p", '<cmd>exe "iput " . v:register<cr>', "Paste below")

-- Explore/Edit
nmap("-", "<cmd>lua MiniFiles.open()<cr>", "Directory")

-- Buffer.
nmap_leader("bd", "<cmd>lua MiniBufremove.delete()<cr>", "Delete")
nmap_leader("bD", "<cmd>lua MiniBufremove.delete(0, true)<cr>", "Delete!")
nmap_leader("bw", "<cmd>lua MiniBufremove.wipeout()<cr>", "Wipeout")
nmap_leader("bW", "<cmd>lua MiniBufremove.wipeout(0, true)<cr>", "Wipeout!")

-- Pick.
local pick_workspace_symbols_live = '<Cmd>Pick lsp scope="workspace_symbol_live"<CR>'
nmap_leader("f/", '<Cmd>Pick history scope="/"<CR>', '"/" history')
nmap_leader("f:", '<Cmd>Pick history scope=":"<CR>', '":" history')
nmap_leader("fb", "<Cmd>Pick buffers<CR>", "Buffers")
nmap_leader("fc", "<Cmd>Pick git_commits<CR>", "Commits (all)")
nmap_leader("fC", '<Cmd>Pick git_commits path="%"<CR>', "Commits (buf)")
nmap_leader("fd", '<Cmd>Pick diagnostic scope="all"<CR>', "Diagnostic workspace")
nmap_leader("fD", '<Cmd>Pick diagnostic scope="current"<CR>', "Diagnostic buffer")
nmap_leader("ff", "<Cmd>Pick files<CR>", "Files")
nmap_leader("fg", "<Cmd>Pick grep_live<CR>", "Grep live")
nmap_leader("fG", '<Cmd>Pick grep pattern="<cword>"<CR>', "Grep current word")
nmap_leader("fh", "<Cmd>Pick help<CR>", "Help tags")
nmap_leader("fH", "<Cmd>Pick hl_groups<CR>", "Highlight groups")
nmap_leader("fl", '<Cmd>Pick buf_lines scope="all"<CR>', "Lines (all)")
nmap_leader("fL", '<Cmd>Pick buf_lines scope="current"<CR>', "Lines (buf)")
nmap_leader("fr", "<Cmd>Pick resume<CR>", "Resume")
nmap_leader("fR", '<Cmd>Pick lsp scope="references"<CR>', "References (LSP)")
nmap_leader("fs", pick_workspace_symbols_live, "Symbols workspace (live)")
nmap_leader("fS", '<Cmd>Pick lsp scope="document_symbol"<CR>', "Symbols document")

nmap_leader("la", "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Actions")
nmap_leader("ld", "<Cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostic popup")
nmap_leader("lf", '<Cmd>lua require("conform").format()<CR>', "Format")
nmap_leader("li", "<Cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation")
nmap_leader("lh", "<Cmd>lua vim.lsp.buf.hover()<CR>", "Hover")
nmap_leader("lr", "<Cmd>lua vim.lsp.buf.rename()<CR>", "Rename")
nmap_leader("lR", "<Cmd>lua vim.lsp.buf.references()<CR>", "References")
nmap_leader("ls", "<Cmd>lua vim.lsp.buf.definition()<CR>", "Source definition")
nmap_leader("lt", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", "Type definition")

xmap_leader("lf", '<Cmd>lua require("conform").format()<CR>', "Format selection")

-- Mini Map
nmap_leader("mt", "<Cmd>lua MiniMap.toggle()<CR>", "Toggle")
nmap_leader("mf", "<Cmd>lua MiniMap.toggle_focus()<CR>", "Focus (toggle)")
nmap_leader("mr", "<Cmd>lua MiniMap.refresh()<CR>", "Refresh")
nmap_leader("ms", "<Cmd>lua MiniMap.toggle_side()<CR>", "Swap side")

-- Git
nmap_leader("gg", "<Cmd>Neogit kind=vsplit<cr>", "Open git")
nmap_leader("gc", "<Cmd>Neogit commit<cr>", "Commit")
