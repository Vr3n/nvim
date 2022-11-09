-- Custom Keymaps function. 
local nnoremap = require("vr3n.keymap").nnoremap
local inoremap = require("vr3n.keymap").inoremap


-- Net-RW Remaps.
nnoremap("<leader>pv", "<cmd>NvimTreeToggle<CR>")

-- File Modification Remaps.
nnoremap("<leader>q", "<cmd>:q<CR>")
nnoremap("<leader>w", "<cmd>:w<CR>")

-- Split Window Pane Remaps.
nnoremap("sj", "<C-W><C-J>")
nnoremap("sk", "<C-W><C-K>")
nnoremap("sl", "<C-W><C-L>")
nnoremap("sh", "<C-W><C-h>")
nnoremap("<leader>sh", "<C-W>s")
nnoremap("<leader>sv", "<C-W>v")

-- Escape Key remap.
inoremap('jk', '<Esc>')

-- ctrl z disable.
nnoremap("<C-Z>", "<nop>")

-- Telescope Remaps.
nnoremap('<leader>ff', "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>")
nnoremap('<leader>fg', '<cmd>Telescope live_grep<cr>')
nnoremap('<leader>fh', '<cmd>Telescope help_tags<cr>')

-- git fugitive remaps.
nnoremap("<leader>gg", "<cmd>:G<CR>")
nnoremap("<leader>gc", "<cmd>:Git commit<CR>")
