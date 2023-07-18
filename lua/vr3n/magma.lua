function MagmaInitPython()
	vim.cmd([[
    :MagmaInit python3
    :MagmaEvaluateArgument a=5
    ]])
end

-- function MagmaInitCSharp()
-- 	vim.cmd([[
--     :MagmaInit .net-csharp
--     :MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof(System.Object),"text/plain");
--     ]])
-- end

vim.cmd([[
:command MagmaInitPython lua MagmaInitPython()
]])
