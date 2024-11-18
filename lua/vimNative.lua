vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.scrolloff = 7
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
-- im old so i have to have vim wait for me :(
vim.o.timeout = false

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- split window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- make half page scrolling always have
-- cursor in the middel of the page if possible
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move half page up and center view around cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move half page down and center view around cursor" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- make saving and closing easier
vim.keymap.set("n", "<Leader>w", ":w<CR>")
vim.keymap.set("n", "<Leader>q", ":q<CR>")
vim.keymap.set("n", "<Leader>x", ":x<CR>")

vim.keymap.set("n", "<Leader>W", ":wa<CR>")
vim.keymap.set("n", "<Leader>Q", ":qa<CR>")
vim.keymap.set("n", "<Leader>X", ":xa<CR>")


-- make v->v select the current word
vim.keymap.set("v", "v", "iw")

--experimental lol
vim.api.nvim_create_user_command('SprichDeutsch',function()
	vim.keymap.set("i", "ue", "ü")
	vim.keymap.set("i", "UE", "Ü")

	vim.keymap.set("i", "ae", "ä")
	vim.keymap.set("i", "AE", "Ä")

	vim.keymap.set("i", "oe", "ö")
	vim.keymap.set("i", "OE", "Ö")

	vim.keymap.set("i", "sz", "ß")
end,{})
