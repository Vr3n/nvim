local status_ok, mason = pcall(require, "mason")

if not status_ok then
   return
end

local mason_lsp_config_status, mason_lspconfig = pcall(require, "mason-lspconfig")

if not mason_lsp_config_status then
    return
end

local mason_nullls_config_status, mason_nullls = pcall(require, "mason-null-ls")

if not mason_lsp_config_status then
    return
end

mason.setup({
    ensure_installed = {
        "tsserver",
        "html",
        "cssls",
        "tailwindcss",
        "sumnekolua",
        "pyright",
        "djlint",
        "jq",
        "flake8",
        "sql_formatter",
    },
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})


-- mason + lspconf 
mason_lspconfig.setup()


-- mason + nullls
mason_nullls.setup({
    ensure_installed = {
        "prettier",
        "stylua",
        "eslint",
    }
})

