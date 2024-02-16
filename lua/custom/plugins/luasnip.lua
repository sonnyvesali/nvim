local ls = require "luasnip"
types = require "luasnip.util.types"

ls.config.set_config {
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
}

vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/custom/plugins/luasnip.lua<CR>")
--

ls.snippets = {
	all = {
		ls.parser.parse_snippet("expand", "--thisis what was expanded"),
	},
	lua = {
		ls.parser.parse_snippet("lf", "local $1 = function($2)\n $0\nend"),
	},
}

return {}
