-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Select all
map("n", "<C-a>", "ggVG", opts)

-- New buffer
map("n", "<leader>n", ":enew<CR>", opts)

-- Delete buffer
map("n", "<A-c>", "<Cmd>:bdelete<CR>", opts)
