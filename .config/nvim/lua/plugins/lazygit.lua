return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>g", ":LazyGit<CR>", { silent = true, noremap = true })
	end,
}
