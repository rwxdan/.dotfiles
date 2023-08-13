return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		{
			"nvim-tree/nvim-web-devicons",
			lazy = true,
		},
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, noremap = true })
		vim.keymap.set("n", "<leader>n", ":NvimTreeFindFileToggle<CR>", { silent = true, noremap = true })
		vim.keymap.set("n", "<C-n>", ":NvimTreeFocus<CR>", { silent = true, noremap = true })
		require("nvim-tree").setup()
	end,
}
