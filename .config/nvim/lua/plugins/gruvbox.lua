return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("gruvbox").setup({
			italic = {
				strings = false,
				comments = true,
				operators = false,
				folds = true,
			},
		})
		vim.cmd.colorscheme("gruvbox")
	end,
}
