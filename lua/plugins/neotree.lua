spec =  
{
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = 
	{
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		setupKeyMaps()
		replaceNetrw()
	end
}

function setupKeyMaps()
	vim.keymap.set("n", "\\", ":Neotree filesystem reveal left<CR>")
end
function replaceNetrw()
--	vim.g.loaded_netrw = 1
--	vim.g.loaded_netrwPlugin = 1
--	TODO: add code here, that open neotree on startup
--	if the argument given is a folder.
--	Also make sure to copy update CWD from the other repo
end

return spec
