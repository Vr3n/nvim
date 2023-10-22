local ls = require("luasnip")
local types = require("luasnip.util.types")

-- local s = ls.snippet
-- local i = ls.insert_node
-- local rep = require("luasnip.extras").rep
-- local fmt = require("luasnip.extras.fmt").fmt

ls.config.set_config({
	-- This tells luasnip to remember to keep around the last snippet.
	-- You can jump back into it even if you move outside of the selection.
	history = true,
	-- This one is cool cause if you have dynamic snippets, it updates as you type!
	updateevents = "TextChanged, TextChangedI",
	-- AutoSnippets.
	enable_autosnippets = true,
	-- Crazy Highlights!!
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "<-", "Error" } },
			},
		},
	},
})

require("luasnip.loaders.from_vscode").lazy_load()
-- Extending the snippets with Friendly snippets.
ls.filetype_extend("ruby", { "rails" })
ls.filetype_extend("python", { "python" })
ls.filetype_extend("php", { "php" })
ls.filetype_extend("java", { "java" })
ls.filetype_extend("typescript", { "typescript", "typescriptreact", "html" })
ls.filetype_extend("javascript", { "javascript", "javascriptreact", "html" })

-- <c-k> is my expansion key.
-- This will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end)

-- This will expand the current item or jump to the previous item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end)

-- <c-l> is selecting within a list of options.
vim.keymap.set("i", "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)
