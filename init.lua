-- Vim Options --
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.relativenumber = true
vim.opt.swapfile = false

-- Vim Keybinds --
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>')
vim.keymap.set('n', '<leader>tc', ':tabc<CR>')
vim.keymap.set('n', '<leader>th', ':tabp<CR>')
vim.keymap.set('n', '<leader>tl', ':tabn<CR>')
vim.keymap.set('n', '<leader>bc', ':bd<CR>')
vim.keymap.set('n', '<leader>bq', ':bd!<CR>')
vim.keymap.set('n', '<leader>wq', ':wq!<CR>')
vim.keymap.set('n', '<leader><leader>q', ':q!<CR>')
vim.keymap.set('n', '<C-s>', ':w<CR>')

vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

-- Load Lazy --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})
