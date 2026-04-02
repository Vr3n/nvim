-- Set up capabilities (Nvim 0.11+ handles many of these defaults automatically)
local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- 1. Create a global LspAttach autocommand for keymaps
-- This replaces the manual 'on_attach' passed to every setup call
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local bufopts = { noremap = true, silent = true, buffer = bufnr }

		-- Standard Keymaps
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

		-- Telescope integrations
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>gd", builtin.lsp_definitions, bufopts)
		vim.keymap.set("n", "<leader>gr", builtin.lsp_references, bufopts)
		vim.keymap.set("n", "<leader>D", builtin.lsp_type_definitions, bufopts)

		-- Formatting and Diagnostics
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, bufopts)
		vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, bufopts)
		vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, bufopts)

		-- 2. Handle Ruff Hover Conflict (Pyright preference)
		if client and client.name == "ruff" then
			client.server_capabilities.hoverProvider = false
		end

		-- Disable svelte semantic tokens.
		if client and client.name == "svelte" then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})

-- 3. Configure Servers using vim.lsp.config (2025 Standard)
-- Note: You no longer need to pass on_attach or capabilities to these calls

vim.lsp.config("svelte", {})

-- Emmet
vim.lsp.config("emmet_ls", {
	filetypes = {
		"html",
		"typescriptreact",
		"javascriptreact",
		"css",
		"sass",
		"scss",
		"less",
		"php",
		"htmldjango",
		"svelte",
	},
	init_options = {
		html = { options = { ["bem.enabled"] = true } },
	},
})

-- BasedPyright
vim.lsp.config("basedpyright", {
	settings = {
		basedpyright = {
			typeCheckingMode = "standard",
			disableOrganizeImports = true,
		},
		python = { analysis = { ignore = { "*" } } },
	},
})

-- Lua LS
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = { library = vim.api.nvim_get_runtime_file("", true) },
			telemetry = { enable = false },
		},
	},
})

-- 4. Enable the servers (This replaces .setup())
local servers = { "clangd", "ruff", "basedpyright", "ts_ls", "lua_ls", "htmx", "tailwindcss", "emmet_ls", "svelte" }
for _, lsp in ipairs(servers) do
	vim.lsp.enable(lsp)
end
