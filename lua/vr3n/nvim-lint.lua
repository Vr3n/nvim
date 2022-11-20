local status_ok, configs = pcall(require, 'lint')

if not status_ok then
    return
end

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function ()
        configs.try_lint()
    end
})
