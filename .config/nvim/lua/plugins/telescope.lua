return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		vim.keymap.set(
			"n",
			"<space>f",
			require("telescope.builtin").find_files,
			{ desc = "(Telescope) Search current working directory" }
		)
		vim.keymap.set("n", "<space>c", function()
			require("telescope.builtin").find_files({
				cwd = "/home/mitchell/config",
				hidden = true,
			})
		end, { desc = "(Telescope) Search config folder" })
	end,
}
