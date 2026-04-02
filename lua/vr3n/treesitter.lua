local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	return
end

configs.setup({
	ensure_installed = {
		"rust",
		"lua",
		"typescript",
		"python",
		"javascript",
		"scss",
		"tsx",
		"json",
		"java",
		"html",
		"diff",
		"css",
		"jsx",
		"gitignore",
	}, -- one of "all", "maintained"{parsers with maintainers}, or a list of languages.
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true, disable = { "yaml" } },
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["aa"] = "@paramter.outer",
				["ia"] = "@paramter.outer",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
				["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
			},
			selection_modes = {
				["@parameter.outer"] = "v", -- charwise
				["@function.outer"] = "V", -- linewise
				["@class.outer"] = "<c-v>", -- blockwise
			},
			include_surrounding_whitespace = true,
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]f"] = "@function.start",
				["]]"] = "@class.outer",
				["]o"] = "@loop.*",
			},
			goto_next_end = {
				["]F"] = "@function.start",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[f"] = "@function.start",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["]f"] = "@function.start",
				["]["] = "@class.outer",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		-- 1. Get the filetype of the buffer that was just opened
		local ft = vim.bo[args.buf].filetype

		-- 2. Check if Treesitter has a parser installed for this exact filetype
		local lang = vim.treesitter.language.get_lang(ft)

		-- 3. If a parser exists, cleanly start Treesitter for this specific buffer
		if lang and pcall(vim.treesitter.get_parser, args.buf, lang) then
			vim.treesitter.start(args.buf)
		end
	end,
})
