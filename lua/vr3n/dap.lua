-- DAP UI setup.
require("dapui").setup()

require("nvim-dap-virtual-text").setup({
	commented = true,
})

local dap = require("dap")

dap.defaults.fallback.exception_breakpoints = { "uncaught" }

vim.fn.sign_define("DapBreakPoint", {
	text = "●",
	texthl = "DiagnosticError",
})

vim.fn.sign_define("DapBreakpointCondition", {
	text = "",
	texthl = "DiagnosticError",
})
vim.fn.sign_define("DapLogPoint", {
	text = "•",
	texthl = "DiagnosticInfo",
})
vim.fn.sign_define("DapStopped", {
	text = "■",
	texthl = "Special",
})

-- Python Dap.
--
local py = require("dap-python")

py.setup("~/.virtualenvs/debugpy/bin/python3", {
	include_configs = true,
	console = "internalConsole",
})
table.insert(dap.configurations.python, {
	type = "python",
	request = "launch",
	name = "Launch file",
	program = "${file}",
	pythonPath = function()
		return "python3"
	end,
})
table.insert(dap.configurations.python, {
	type = "python",
	request = "launch",
	name = "FastAPI",
	program = function()
		return "./main.py"
	end,
	pythonPath = function()
		return "python"
	end,
})
table.insert(dap.configurations.python, {
	type = "python",
	request = "launch",
	name = "FastAPI module",
	module = "uvicorn",
	args = {
		"main:app",
		"--reload",
		"--use-colors",
	},
	pythonPath = "python",
	console = "integratedTerminal",
})
py.test_runner = "pytest"
