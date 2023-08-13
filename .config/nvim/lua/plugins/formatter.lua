local prettier = function()
	return {
		exe = "prettier",
		args = {
			"--config-precedence",
			"prefer-file",
			"--stdin-filepath",
			vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
		},
		stdin = true,
		try_node_modules = true,
	}
end

local clang_format = function()
	return {
		exe = "clang-format",
		args = {
			"--assume-filename",
			vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
		},
		stdin = true,
		try_node_modules = true,
	}
end

return {
	{
		"mhartington/formatter.nvim",
		opts = {
			logging = false,
			filetype = {
				typescriptreact = { prettier },
				javascriptreact = { prettier },
				javascript = { prettier },
				typescript = { prettier },
				json = { prettier },
				jsonc = { prettier },
				html = { prettier },
				css = { prettier },
				scss = { prettier },
				graphql = { prettier },
				markdown = { prettier },
				vue = { prettier },
				astro = { prettier },
				yaml = { prettier },
				go = {
					-- goimport
					function()
						return {
							exe = "gofmt",
							args = { "-w" },
							stdin = false,
						}
					end,
				},
				lua = {
					-- Stylua
					function()
						return {
							exe = "stylua",
							args = {},
							stdin = false,
						}
					end,
				},
				python = {
					-- autopep8
					function()
						return {
							exe = "autopep8",
							args = { "--in-place" },
							stdin = false,
						}
					end,
				},
				rust = {
					function()
						return {
							exe = "rustfmt",
							stdin = true,
						}
					end,
				},
				c = { clang_format },
				cpp = { clang_format },
			},
		},
		config = function(_, opts)
			require("formatter").setup(opts)
			-- Runs Formmater on save
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = {
					"*.js",
					"*.mjs",
					"*.cjs",
					"*.jsx",
					"*.ts",
					"*.tsx",
					"*.css",
					"*.scss",
					"*.md",
					"*.html",
					"*.lua",
					"*.json",
					"*.jsonc",
					"*.vue",
					"*.py",
					"*.gql",
					"*.graphql",
					"*.go",
					"*.rs",
					"*.astro",
					"*.c",
					"*.cc",
					"*.cpp",
					"*.h",
				},
				command = "FormatWrite",
			})
			vim.keymap.set("n", "<leader>f", ":Format<CR>", { silent = true, noremap = true })
		end,
	},
}
