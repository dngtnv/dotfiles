return {
  "nvim-telescope/telescope.nvim",
  opts = {
    pickers = {
      find_files = {
        file_ignore_patterns = { "node_modules", "build", "dist", ".next" },
      },
      live_grep = {
        file_ignore_patterns = { "node_modules", "build", "dist", ".next" },
      },
    },
  },
}
