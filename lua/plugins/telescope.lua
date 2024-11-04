return 
{
	"nvim-telescope/telescope.nvim",
	dependencies={"nvim-lua/plenary.nvim"},
	config = function()
		local telescopeHandle = require("telescope.builtin")
		vim.keymap.set("n", "<leader><leader>", telescopeHandle.find_files, {})
	end
}
