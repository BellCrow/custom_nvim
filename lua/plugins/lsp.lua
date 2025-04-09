return {
	{
		"https://github.com/williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "yamlls", "gopls"} })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.pyright.setup({
				cmd = { "basedpyright-langserver", "--stdio" },
				filetypes = { "python" },
			})
			lspconfig.texlab.setup({})
			lspconfig.yamlls.setup({
				settings = {
					yaml = {
						schemas = {
							-- makes sure to always use the kubernetes schmema if the file names end with ".k8s.yaml"
							kubernetes = "/*.k8s.yaml"
						},
					},
				},
			})
			lspconfig.csharp_ls.setup({})
			lspconfig.gopls.setup({})

			vim.o.winborder = 'single'
			local map = function(keys, func, desc, mode)
				mode = mode or "n"
				vim.keymap.set(mode, keys, func, { desc = "LSP: " .. desc })
			end

			map("K", vim.lsp.buf.hover, "Hover Hint")

			-- Jump to the definition of the word under your cursor.
			--  This is where a variable was first declared, or where a function is defined, etc.
			--  To jump back, press <C-t>.
			map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

			-- Find references for the word under your cursor.
			map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

			-- Jump to the implementation of the word under your cursor.
			--  Useful when your language has ways of declaring types without an actual implementation.
			map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

			-- Jump to the type of the word under your cursor.
			--  Useful when you're not sure what type a variable is and you want to see
			--  the definition of its *type*, not where it was *defined*.
			map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

			-- Fuzzy find all the symbols in your current document.
			--  Symbols are things like variables, functions, types, etc.
			map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

			-- Fuzzy find all the symbols in your current workspace.
			--  Similar to document symbols, except searches over your entire project.
			map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

			-- Rename the variable under your cursor.
			--  Most Language Servers support renaming across files, etc.
			map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

			-- Execute a code action, usually your cursor needs to be on top of an error
			-- or a suggestion from your LSP for this to activate.
			map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

			-- WARN: This is not Goto Definition, this is Goto Declaration.
			--  For example, in C this would take you to the header.
			map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			--[[
			--Interesting functions from vim.lsp.buf.
			--vim.lsp.buf.clear_references() - clears all highlights from current buffer
			--vim.lsp.buf.code_action() -  select code action on the current cursor
			--vim.lsp.buf.declaration() - goto declaration
			--vim.lsp.buf.document_symbol() - list document symbols
			--vim.lsp.buf.implementation() - lists all implementations for current symbol
			--vim.lsp.buf.incoming_calls() - list all callers of the current symbol (how does this differ from the next one ?)
			--vim.lsp.buf.references() - list references of the current symbol 
			--vim.lsp.buf.outgoing_calls() - list all called symbols for the current symbols
			--vim.lsp.buf.rename() - rename symbol
			--]]
		end,
	},
	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
				{ path = "~/repos/personal/noita_spell_sorter/api_documentation/noita_lua_ls_documentation.lua", words = { "noita" } },
			},
		},
	},
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {},
	},
}
