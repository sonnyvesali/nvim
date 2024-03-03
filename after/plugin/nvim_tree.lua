-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
	trash = {
		cmd = "trash"
	},
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
		adaptive_size = true,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true
	}

})

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>')
