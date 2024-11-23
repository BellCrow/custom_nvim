return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			'nvim-neotest/nvim-nio',
			'mfussenegger/nvim-dap-python',
		},
	},
	config = function()
		local dap = require('dap')
		vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, {})
		vim.keymap.set('n', '<leader>dc', dap.continue, {})
	end,
}
