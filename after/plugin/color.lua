require('tokyonight').setup({
    style = "night",
    transparent = true,
    dim_inactive = true,
    styles = {
        sidebars = "transparent",
        floats = "transparent",
    },
})

vim.cmd("colorscheme tokyonight-night")

-- Signify ColorScheme changes.
vim.cmd [[
    highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
    highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
    highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
]]

