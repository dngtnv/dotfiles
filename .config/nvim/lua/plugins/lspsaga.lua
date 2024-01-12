return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-treesitter/nvim-treesitter",
	},

	config = function()
		require("lspsaga").setup({
			ui = {
				-- This option only works in Neovim 0.9
				title = true,
				-- Border type can be single, double, rounded, solid, shadow.
				border = "single",
				devicon = true,
				winblend = 0,
				expand = "",
				collapse = "",
				code_action = "💡",
				incoming = "󰏷 ",
				outgoing = "󰏻 ",
				hover = " ",
				kind = {}, --require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
			},
			symbol_in_winbar = {
				enable = false,
				separator = " ",
				hide_keyword = false,
				show_file = true,
				folder_level = 1,
				color_mode = true,
				delay = 300,
			},
			lightbulb = {
				enable = false,
				sign = false,
				sign_priority = 40,
				virtual_text = true,
				debounce = 10,
			},
		})

		-- Mappings
		local opts = { noremap = true, silent = true }
		-- LSP finder - Find the symbol's definition
		-- If there is no definition, it will instead be hidden
		-- When you use an action in finder like "open vsplit",
		-- you can use <C-t> to jump back
		vim.keymap.set("n", "gh", "<cmd>Lspsaga finder<CR>", opts)

		-- Code action
		vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
		vim.keymap.set("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

		-- Rename
		vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", opts)

		-- Peek Definition
		-- you can edit the definition file in this floating window
		-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
		-- It also supports tagstack
		-- Use <C-t> to jump back
		vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
		-- Go to definition
		-- map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)

		-- Show line diagnostics
		-- You can pass argument ++unfocus to
		-- unfocus the show_line_diagnostics floating window
		vim.keymap.set("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

		-- Show cursor diagnostic
		-- Like show_line_diagnostics, it supports passing the ++unfocus argument
		vim.keymap.set("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

		-- Show buffer diagnostics
		vim.keymap.set("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", opts)

		-- Diagnsotic jump
		-- You can use <C-o> to jump back to your previous location
		vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
		vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

		-- Diagnostic jump with filters such as only jumping to an error
		vim.keymap.set("n", "[E", function()
			require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
		end, opts)
		vim.keymap.set("n", "]E", function()
			require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
		end, opts)

		-- Toggle outline
		vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)

		-- Hover Doc
		-- If there is no hover doc,
		-- there will be a notification stating that
		-- there is no information available.
		-- To disable it just use ":Lspsaga hover_doc ++quiet"
		-- Pressing the key twice will enter the hover window
		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

		-- If you want to keep the hover window in the top right hand corner,
		-- you can pass the ++keep argument
		-- Note that if you use hover with ++keep, pressing this key again will
		-- close the hover window. If you want to jump to the hover window
		-- you should use the wincmd command "<C-w>w"
		-- map("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>", opts)

		-- Call hierarchy
		vim.keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", opts)
		vim.keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", opts)
	end,
}
