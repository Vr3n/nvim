-- Custom Keymaps function. 
local nnoremap = require("vr3n.keymap").nnoremap
local inoremap = require("vr3n.keymap").inoremap


-- Net-RW Remaps.
nnoremap("<leader>pv", "<cmd>NvimTreeToggle<CR>")

-- File Modification Remaps.
nnoremap("<leader>q", "<cmd>Bdelete<CR>")
nnoremap("<leader>w", "<cmd>w<CR>")

-- navigation keymaps.
nnoremap("<leader>6", "<C-6>")

-- Split Window Pane Remaps.
nnoremap("sj", "<C-W><C-J>")
nnoremap("sk", "<C-W><C-K>")
nnoremap("sl", "<C-W><C-L>")
nnoremap("sh", "<C-W><C-h>")
nnoremap("<leader>sh", "<C-W>s")
nnoremap("<leader>sv", "<C-W>v")
nnoremap("<leader>--", "<C-W>_")
nnoremap("<leader>|", "<C-W>|")
nnoremap("<leader>=", "<C-W>=")

-- Escape Key remap.
inoremap('jk', '<Esc>')

-- ctrl z disable.
nnoremap("<C-Z>", "<nop>")

-- Telescope Remaps.
nnoremap('<leader>ff', "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>")
nnoremap('<leader>fg', '<cmd>Telescope live_grep<cr>')
nnoremap('<leader>fb', "<cmd>Telescope buffers<cr>")
nnoremap('<leader>fh', '<cmd>Telescope help_tags<cr>')

-- git fugitive remaps.
nnoremap("<leader>gs", "<cmd>G<CR>")
nnoremap("<leader>gc", "<cmd>G commit<CR>")
nnoremap("<leader>gll", "<cmd>G log<CR>")
nnoremap("<leader>gd", "<cmd>G diff<CR>")
nnoremap("<leader>gds", "<cmd>Gdiffsplit<CR>")
nnoremap("<leader>gbb", "<cmd>G blame<CR>")


-- TermToggle Remps.
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
