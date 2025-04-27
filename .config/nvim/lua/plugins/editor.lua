return {
	"nvim-telescope/telescope.nvim",
	opts = {
		pickers = {
			find_files = {
				hidden = true,
				file_ignore_patterns = { "node_modules", "build", "dist", ".next" },
			},
			live_grep = {
				hidden = true,
				file_ignore_patterns = { "node_modules", "build", "dist", ".next" },
			},
		},
	},
}
