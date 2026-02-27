--@module "compile-mode"
--@type CompileModeOpts

vim.g.compile_mode = {
	default_command = {
		python = "uv run %",
		rust = "cargo run %",
		go = "go run %",
		lua = "lua %",
	},
	baleia_setup = true,
}
