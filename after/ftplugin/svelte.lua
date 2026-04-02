vim.schedule(function()
	-- Safely attempt to start Treesitter for the current buffer
	pcall(vim.treesitter.start)
end)
