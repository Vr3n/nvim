local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
    return
end

configs.setup({
    ensure_installed = {
        "rust",
        "lua",
        "php",
        "typescript",
        "python",
        "javascript",
        "scss",
        "tsx",
        "json",
        "java",
        "html",
        "diff",
        "gitignore",
    },                       -- one of "all", "maintained"{parsers with maintainers}, or a list of languages.
    sync_install = false,
    ignore_install = { "" }, -- list of parserr to ignore installing
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
})
