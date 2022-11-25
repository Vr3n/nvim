-- DAP UI setup.
require("dapui").setup()

require("nvim-dap-virtual-text").setup({
	commented = true,
})

-- Python Dap.
require("dap-python").setup("~/.virtualenvs/debugpy/bin/python3")
