local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- Latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("core.options")
require("lazy").setup("plugins", opts)
require("core.keymaps")
require("colorschemes.config")
