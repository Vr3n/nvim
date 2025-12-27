local status_ok, configs = pcall(require, "null-ls")

if not status_ok then
	return
end

local formatting = configs.builtins.formatting
-- Note: diagnostics variable removed as ruff was the only one using it
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

configs.setup({
	sources = {
		formatting.prettier,
		formatting.stylua,
		-- diagnostics.ruff removed because it is deprecated in none-ls 2025.
		-- Native Ruff LSP handles diagnostics and formatting now.
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- In 2025, specify the filter to avoid conflicts 
					-- between null-ls and native LSP formatters
					vim.lsp.buf.format({ 
						bufnr = bufnr,
						filter = function(f_client)
							return f_client.name == "null-ls"
						end,
						timeout_ms = 10000 
					})
				end,
			})
		end
	end,
})

