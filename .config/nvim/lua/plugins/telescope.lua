return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.2",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
		vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>ph", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>po", builtin.oldfiles, {})

		require("telescope").setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--trim",
				},
				prompt_prefix = "    ",
			},
			pickers = {
				find_files = { theme = "dropdown" },
				live_grep = { theme = "dropdown" },
				buffers = { theme = "dropdown" },
				help_tags = { theme = "dropdown" },
				oldfiles = { theme = "dropdown" },
			},
			extensions = {},
		})
	end,
}
