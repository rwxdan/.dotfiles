return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			context_commentstring = {
				enable = true,
			},
			ensure_installed = {
				"go",
				"lua",
				"rust",
				"vim",
				"vimdoc",
			},

			sync_install = false,
			auto_install = true,
			ignore_install = {},
			highlight = {
				enable = true,
				disable = {},
				additional_vim_regex_highlighting = false,
			},
			autotag = {
				enable = true,
				filetypes = {
					"html",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"svelte",
					"vue",
					"tsx",
					"jsx",
					"markdown",
					"astro",
				},
			},
			indent = {
				enable = true,
			},
		})
	end,
}
