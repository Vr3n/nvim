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
		"svelte",
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
			lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
			keymaps = {
				-- Assignments
				["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
				["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
				["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
				["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

				-- Parameters/Arguments
				["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
				["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

				-- Conditionals
				["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
				["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

				-- Loops
				["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
				["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

				-- Functions/Methods
				["af"] = { query = "@function.outer", desc = "Select outer part of a function/method" },
				["if"] = { query = "@function.inner", desc = "Select inner part of a function/method" },

				-- Classes
				["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },

				-- Return statements
				["ar"] = { query = "@return.outer", desc = "Select outer part of a return statement" },
				["ir"] = { query = "@return.inner", desc = "Select inner part of a return statement" },
			},
			selection_modes = {
				["@parameter.outer"] = "v",
				["@function.outer"] = "V",
				["@class.outer"] = "<c-v>",
			},
			include_surrounding_whitespace = true,
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]f"] = { query = "@function.outer", desc = "Next function start" },
				["]c"] = { query = "@class.outer", desc = "Next class start" },
				["]a"] = { query = "@parameter.inner", desc = "Next argument start" },
				["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
				["]l"] = { query = "@loop.outer", desc = "Next loop start" },
			},
			goto_next_end = {
				["]F"] = { query = "@function.outer", desc = "Next function end" },
				["]C"] = { query = "@class.outer", desc = "Next class end" },
				["]A"] = { query = "@parameter.inner", desc = "Next argument end" },
			},
			goto_previous_start = {
				["[f"] = { query = "@function.outer", desc = "Previous function start" },
				["[c"] = { query = "@class.outer", desc = "Previous class start" },
				["[a"] = { query = "@parameter.inner", desc = "Previous argument start" },
				["[i"] = { query = "@conditional.outer", desc = "Previous conditional start" },
				["[l"] = { query = "@loop.outer", desc = "Previous loop start" },
			},
			goto_previous_end = {
				["[F"] = { query = "@function.outer", desc = "Previous function end" },
				["[C"] = { query = "@class.outer", desc = "Previous class end" },
				["[A"] = { query = "@parameter.inner", desc = "Previous argument end" },
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>sn"] = { query = "@parameter.inner", desc = "Swap parameter with next" },
				["<leader>sF"] = { query = "@function.outer", desc = "Swap function with next" },
			},
			swap_previous = {
				["<leader>sp"] = { query = "@parameter.inner", desc = "Swap parameter with previous" },
				["<leader>sf"] = { query = "@function.outer", desc = "Swap function with previous" },
			},
		},
	},
})

vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
	pattern = "*",
	callback = function(args)
		-- Ensure the buffer is still valid before querying it
		if not vim.api.nvim_buf_is_valid(args.buf) then
			return
		end

		local ft = vim.bo[args.buf].filetype
		if ft == "" then
			return
		end

		local lang = vim.treesitter.language.get_lang(ft)

		-- Only attempt to start if a parser exists for this language
		if lang then
			-- Schedule asynchronously to prevent UI freezing on large files
			vim.schedule(function()
				if vim.api.nvim_buf_is_valid(args.buf) then
					pcall(vim.treesitter.start, args.buf, lang)
				end
			end)
		end
	end,
})
