local status_ok, toggleterm = pcall(require, "toggleterm")

if not status_ok then
    return
end

toggleterm.setup({
    size = 20,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    insert_mappings = true,
    float_opts = {
        border = "curved",
        winblend = 0,
    },
})


require("exrc").setup({
    files = {
        ".nvimrc.lua",
        ".nvimrc",
        ".exrc.lua",
        ".exrc",
    },
})

require("Comment").setup({
    opleader = {
        -- line-comment keymap
        line = "gc",
        -- block comment keymap.
        block = "gb",
    },
})


require("nvim-tree").setup({
    view = {
        adaptive_size = true,
    },
    git = {
        ignore = false,
    },
})

require("ibl").setup({})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function() vim.highlight.on_yank() end,
})
