return {
	"leoluz/nvim-dap-go",

	dependencies = {
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		require("dap-go").setup()
	end,
}
