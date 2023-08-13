return {
	"NvChad/nvim-colorizer.lua",
	opts = {
		filetypes = { "*" },
		user_default_options = {
			rgb_fn = true, -- CSS rgb() and rgba() functions
			hsl_fn = true, -- CSS hsl() and hsla() functions
			css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
			css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			mode = "background", -- Set the display mode.
			tailwind = true, -- Enable tailwind colors
			sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
			virtualtext = "■",
		},
		buftypes = {},
	},
}
