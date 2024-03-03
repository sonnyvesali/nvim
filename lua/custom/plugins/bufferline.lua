return {
	'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function()
		vim.opt.termguicolors = true
		require("bufferline").setup(
			{
				options = {
					diagnostics = 'nvim_lsp',
					diagnostics_indicator = function(count, level, _, _)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
					end

				}
			}
		)
	end
}
