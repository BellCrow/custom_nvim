function replaceNetrw()
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	-- Initialize startup_dir to nil
	local startup_dir = nil

	-- Iterate over all command-line arguments to find the first directory
	for _, arg in ipairs(vim.fn.argv()) do
		if vim.fn.isdirectory(arg) == 1 then
			startup_dir = arg
			break
		end
	end

	-- Use this directory with Neo-tree
	source_selector = {
		-- Set initial root to the directory we found
		default_source = startup_dir,
	}

	-- TODO: add code here, that open neotree on startup
	-- if the argument given is a folder.
	-- Also make sure to copy update CWD from the other repo
	-- if vim was called with an argument specifying a directory, make that directory the CWD
	-- taken from: https://www.reddit.com/r/neovim/comments/1du176f/how_to_align_cwd_with_opened_folder/
	vim.api.nvim_create_autocmd("VimEnter", {
		pattern = "*",
		callback = function()
			local from = vim.uv.cwd()
			local target
			local args = vim.fn.argv()
			if type(args) ~= "table" then
				return
			end

			for _, arg in ipairs(type(args) == "table" and args or {}) do
				if vim.fn.isdirectory(arg) then
					target = vim.fn.fnamemodify(arg, ":p")
					if target ~= nil and vim.fn.isdirectory(target) ~= 0 then
						vim.cmd(string.format(":cd %s", target))
					end
				end
			end
			return true
		end,
	})
end

function setupKeyMaps()
	vim.keymap.set("n", "\\", toogleNeoTree)
end

function hideNeoTree()
	require("neo-tree.command").execute({ action = "close" })
end

function toogleNeoTree()
	if isNeoTreeWindowFocused() then
		hideNeoTree()
	else
		focusNeoTree()
	end
end

function isNeoTreeWindowFocused()
	return vim.bo.filetype == "neo-tree"
end

function focusNeoTree()
	require("neo-tree.command").execute({ action = "focus" })
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
		setupKeyMaps()
		replaceNetrw()
	end,
}
