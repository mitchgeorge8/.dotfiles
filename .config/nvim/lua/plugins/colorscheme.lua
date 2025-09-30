return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme kanagawa]])
	end,
	-- "navarasu/onedark.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- congig = function()
	-- 	require("onedark").setup({
	-- 		style = "warmer",
	-- 	})
	-- 	require("onedark").load()
	-- end,
}
