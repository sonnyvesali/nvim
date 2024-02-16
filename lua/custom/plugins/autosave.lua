require("auto-save").setup {
	condition = function(buf)
		if vim.bo[buf].filetype == "harpoon" then
			return false
		end
	end
}

return {}
