return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			integrations = {
				alpha = true,
				mason = true,
				neotree = true,
				nvimtree = true,
			}
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
