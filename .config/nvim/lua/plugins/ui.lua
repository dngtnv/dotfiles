return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "storm",
			transparent = false,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "tokyonight",
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			popup_border_style = "rounded",
			window = {
				position = "float",
			},
		},
	},
	{
		"akinsho/bufferline.nvim",
		opts = {
			options = {
				indicator = {
					icon = "▎",
					style = "icon",
				},
				right_mouse_command = "vertical sbuffer %d",
				middle_mouse_command = "bdelete! %d",
				separator_style = "thin",
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
			},
			highlights = {
				close_button = {
					fg = "#f38ba8",
				},
				close_button_visible = {
					fg = "#f38ba8",
				},
				close_button_selected = {
					fg = "#f38ba8",
				},
				buffer_selected = {
					bold = true,
					italic = false,
				},
			},
		},
	},
	{
		"folke/noice.nvim",
		opts = function(_, opts)
			-- Add a route for each string you want to filter
			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			})

			table.insert(opts.routes, {
				filter = {
					event = "notify",
					find = "^.*WARNING.*vim.treesitter.get_parser.*$",
				},
				opts = { skip = true },
			})

			opts.presets.lsp_doc_border = true -- show border on hover
		end,
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 10000,
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true, -- one statusline for all windows
			},
			sections = {
				lualine_a = {
					{
						"mode",
						icons_enabled = true,
						icon = "",
						on_click = nil,
					},
				},
				lualine_b = { { "branch", icons_enabled = true, icon = "" }, "diff", "diagnostics" },
			},
		},
	},
	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					header = [[
██████╗ ███╗   ██╗ ██████╗████████╗███╗   ██╗██╗   ██╗
██╔══██╗████╗  ██║██╔════╝╚══██╔══╝████╗  ██║██║   ██║
██║  ██║██╔██╗ ██║██║  ███╗  ██║   ██╔██╗ ██║██║   ██║
██║  ██║██║╚██╗██║██║   ██║  ██║   ██║╚██╗██║╚██╗ ██╔╝
██████╔╝██║ ╚████║╚██████╔╝  ██║   ██║ ╚████║ ╚████╔╝ 
╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝  ╚═══╝  ╚═══╝  
          ]],
				},
			},
		},
	},
}
