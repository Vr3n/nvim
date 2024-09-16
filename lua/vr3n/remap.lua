-- Net-RW Remaps.
vim.keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<CR>")

-- File Modification Remaps.
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")

-- navigation keymaps.
vim.keymap.set("n", "<leader>6", "<C-6>")

-- move commands to move when highlighted.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy between clipboard and vim.
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Won't take over your clipboard.
vim.keymap.set("x", "<leader>p", '"_dP')

-- Split Window Pane Remaps.
vim.keymap.set("n", "sj", "<C-W><C-J>")
vim.keymap.set("n", "sk", "<C-W><C-K>")
vim.keymap.set("n", "sl", "<C-W><C-L>")
vim.keymap.set("n", "sh", "<C-W><C-h>")
vim.keymap.set("n", "<leader>sh", "<C-W>s")
vim.keymap.set("n", "<leader>sv", "<C-W>v")
vim.keymap.set("n", "<leader>--", "<C-W>_")
vim.keymap.set("n", "<leader>|", "<C-W>|")
vim.keymap.set("n", "<leader>=", "<C-W>=")

-- Escape Key remap.
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

-- ctrl z disable.
vim.keymap.set("n", "<C-Z>", "<nop>")

-- Telescope Remaps.
local builtin = require("telescope.builtin")
vim.keymap.set(
    "n",
    "<leader>ff",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>"
)
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>vh", "<cmd>Telescope help_tags<cr>")
vim.keymap.set("n", "<leader>pws", function()
    local word = vim.fn.expand("<cword>")
    builtin.grep_string({ search = word })
end)
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)



-- git fugitive remaps.
vim.keymap.set("n", "<leader>gs", "<cmd>G<CR>")
vim.keymap.set("n", "<leader>gc", "<cmd>G commit<CR>")
vim.keymap.set("n", "<leader>gll", "<cmd>G log<CR>")
vim.keymap.set("n", "<leader>gd", "<cmd>G diff<CR>")
vim.keymap.set("n", "<leader>gds", "<cmd>Gdiffsplit!<CR>")
vim.keymap.set("n", "<leader>gbb", "<cmd>G blame<CR>")

-- TermToggle Remps.
function _G.set_terminal_keymaps()
    local opts = { buffer = 0 }
    vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
    vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- null-ls formatter remap.
vim.keymap.set("n", "<leader>fr", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 10000 })<cr>")
vim.keymap.set("n", "<leader>k", "<cmd>lua vim.diagnostic.open_float()<cr>")

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- DAP Keymaps.
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set(
    "n",
    "<leader>lp",
    "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>"
)
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>")

-- DAP UI REmap.
vim.keymap.set("n", "<leader>dbv", "<cmd>lua require('dapui').toggle()<CR>")
