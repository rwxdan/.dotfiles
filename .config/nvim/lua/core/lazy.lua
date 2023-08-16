local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	install = {
		missing = true,
		colorscheme = { "onedark", "habamax" },
	},
	ui = {
		border = "rounded",
	},
	defaults = {
		lazy = false,
		version = nil,
	},
	checker = {
		enabled = false,
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
	performance = {
		rtp = {
			reset = true,
			disabled_plugins = {
				"gzip",
				-- "matchit",
				-- "matchparen",
				"netrwPlugin",
				"tohtml",
				"tarPlugin",
				"tutor",
				"zipPlugin",
			},
		},
	},
}
require("lazy").setup("plugins", opts)
