return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	config = function()
		require("mason").setup({
			ui = {
				border = "rounded",
			},
		})
		local registry = require("mason-registry")
		for _, pkg_name in ipairs({ "stylua", "prettier", "autopep8", "clang-format" }) do
			local ok, pkg = pcall(registry.get_package, pkg_name)
			if ok then
				if not pkg:is_installed() then
					pkg:install()
				end
			end
		end
		require("mason-lspconfig").setup({
			ensure_installed = {
				"bashls",
				"cssls",
				"emmet_ls",
				"gopls",
				"lua_ls",
				"pyright",
				"rust_analyzer",
				"clangd",
				"tsserver",
				"tailwindcss",
				"yamlls",
				"astro",
				"eslint",
				"jsonls",
				"marksman",
				"html",
			},
			automatic_installation = true,
			handlers = nil,
		})
	end,
}
