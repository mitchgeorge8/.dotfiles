return {
	"mikavilpas/yazi.nvim",
	version = "*", -- use the latest stable version
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		{
			"<leader>-",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "(Yazi) Open yazi at the current file",
		},
		-- {
		-- 	-- Open in the current working directory
		-- 	"<leader>cw",
		-- 	"<cmd>Yazi cwd<cr>",
		-- 	desc = "(Yazi) Open the file manager in nvim's working directory",
		-- },
		-- {
		-- 	"<c-up>",
		-- 	"<cmd>Yazi toggle<cr>",
		-- 	desc = "(Yazi) Resume the last yazi session",
		-- },
	},
	opts = {
		-- if you want to open yazi instead of netrw, see below for more info
		open_for_directories = false,
		keymaps = {
			show_help = "<f1>",
		},
	},
	-- 👇 if you use `open_for_directories=true`, this is recommended
	init = function()
		-- mark netrw as loaded so it's not loaded at all.
		--
		-- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
		vim.g.loaded_netrwPlugin = 1
	end,
}
