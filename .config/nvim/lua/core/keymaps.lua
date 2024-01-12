-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remove highlight
map("n", "<Esc>", ":noh<CR>", opts)
-- Select all
map("n", "<C-a>", "ggVG", opts)

-- Remap splits navigation to just CTRL + hjkl
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Make adjusting split sizes a bit more friendly
map("n", "<C-Left>", ":vertical resize +6<CR>", opts)
map("n", "<C-Right>", ":vertical resize 0<CR>", opts)
map("n", "<C-Up>", ":resize +6<CR>", opts)
map("n", "<C-Down>", ":resize 0<CR>", opts)

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope mappings --
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>ft", ":TodoTelescope<CR>", opts)

-- Vim-tmux-navigator
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", opts)
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", opts)
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", opts)
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", opts)
