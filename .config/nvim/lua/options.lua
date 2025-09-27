vim.o.clipboard = "unnamedplus"
vim.o.number = true
vim.o.relativenumber = false
vim.o.signcolumn = "yes"
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.updatetime = 300
vim.o.termguicolors = true
vim.o.mouse = "a"

vim.wo.fillchars = "eob: "

vim.opt.completeopt = { "menuone", "noselect", "popup" }

vim.keymap.set({ "n", "v" }, "<space>p", '"0p', { desc = "Paste from 0 register" })

vim.api.nvim_create_autocmd("VimEnter", { callback = function() require "lazy".update({ show = false }) end })
