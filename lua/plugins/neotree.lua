require("utils")

function ReplaceNetrw()
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	-- TODO: add code here, that open neotree on startup
	-- if the argument given is a folder.
	-- Also make sure to copy update CWD from the other repo
	-- if vim was called with an argument specifying a directory, make that directory the CWD
	-- taken from: https://www.reddit.com/r/neovim/comments/1du176f/how_to_align_cwd_with_opened_folder/
	vim.api.nvim_create_autocmd("VimEnter", {
		pattern = "*",
		callback = function()
			local is_directory, absolute_path = IsSingleFolderLoaded()
			if is_directory then
				vim.cmd(string.format(":cd %s", absolute_path))
				FocusNeoTree()
			end
		end,
	})
end

function HideNeoTree()
	require("neo-tree.command").execute({ action = "close" })
end

function IsNeoTreeWindowFocused()
	return vim.bo.filetype == "neo-tree"
end

function FocusNeoTree()
	require("neo-tree.command").execute({ action = "focus" })
end

function ToogleNeoTree()
	if IsNeoTreeWindowFocused() then
		HideNeoTree()
	else
		FocusNeoTree()
	end
end

function SetupNeoTreeKeyMaps()
	vim.keymap.set("n", "\\", ToogleNeoTree)
	require("neo-tree").setup({
		window = {
			mappings = {
				["l"] = "open",
				["h"] = "close_node",
			},
		},
	})
end

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		SetupNeoTreeKeyMaps()
		ReplaceNetrw()
	end,
}
