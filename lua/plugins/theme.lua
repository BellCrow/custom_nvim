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
			},
			custom_highlights = function(colors)
				local u = require("catppuccin.utils.colors")
				return {
					CursorLine = {
						bg = u.vary_color(
							{ latte = u.lighten(colors.mantle, 0.90, colors.base) },
							u.darken(colors.surface0, 0.14, colors.base)
						),
					},
				}
			end,
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
