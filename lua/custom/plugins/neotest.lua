vim.api.nvim_set_keymap('n', '<leader>rt', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ts', ':lua require("neotest").output.open({enter = true})<CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ts', ':lua require("neotest").output.open({enter = true})<CR>',
	{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tsm', ':lua require("neotest").summary.toggle()<CR>',
	{ noremap = true, silent = true })






return {}
