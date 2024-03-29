vim.keymap.set("n", "<leader>gs", ':lua require("neogit").open({kind = "auto"})<CR>')
return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
		"ibhagwan/fzf-lua",
	},
	config = true
}
