local status_ok, configs = pcall(require, "null-ls")

if not status_ok then
	return
end

local formatting = configs.builtins.formatting
local diagnostics = configs.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

configs.setup({
	sources = {
		formatting.prettier,
		formatting.stylua,
		formatting.autopep8,
		diagnostics.eslint_d,
		diagnostics.ruff,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ timeout_ms = 10000 })
				end,
			})
		end
	end,
})
