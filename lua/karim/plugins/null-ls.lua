return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			require("mason-null-ls").setup({
				ensure_installed = {
					"stylua",
					"prettierd",
					"shfmt",
				},
			}),
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format()
						end,
					})
				end
			end,
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.prettierd.with({
					env = {
						PRETTIERD_DEFAULT_CONFIG = vim.fn.expand(
							"~/.config/nvim/lua/karim/lsp-config//.prettierrc.json"
						),
					},
				}),
			},
		})
	end,
}
