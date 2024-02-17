vim.api.nvim_set_keymap('n', '<leader>rt', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ts', ':lua require("neotest").output.open({enter = true})<CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ts', ':lua require("neotest").output.open({enter = true})<CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tsm', ':lua require("neotest").summary.toggle()<CR>',
	{ noremap = true, silent = true })

return {
	"nvim-neotest/neotest",
	dependencies = {
		'sidlatau/neotest-dart',
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter"
	},
	config = function()
		require('neotest').setup({
			adapters = {
				require('neotest-dart') {
					command = 'flutter',
					use_lsp = true,
					custom_test_method_names = {},
				},
			},
		})
	end,
}
