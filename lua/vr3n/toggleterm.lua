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
    shell = "pwsh.exe",
    insert_mappings = true,
    float_opts = {
        border = "curved",
        winblend = 0,
    },
})

