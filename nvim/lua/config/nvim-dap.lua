local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dapui_status_ok, dapui = pcall(require, "dapui")
if not dapui_status_ok then
	return
end

local dappython_status_ok, dap_python = pcall(require, "dap-python")
if not dappython_status_ok then
	return
end

dapui.setup()

dap_python.setup(vim.g.python3_host_prog)
dap_python.test_runner = "pytest"
require("dap.ext.vscode").load_launchjs()

vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🟠", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "📂", texthl = "", linehl = "", numhl = "" })

table.insert(require("dap").configurations.python, {
	type = "python",
	request = "launch",
	name = "My custom launch configuration",
	--program = "${file}",
	program = "/Users/alexis/workspace/test.py",
	console = "integratedTerminal",
	logToFile = true,
	args = { "a", "b" },
	pythonPath = "/Users/alexis/miniconda3/envs/workbench/bin/python",
})

-- :h dap-api
local opts = { remap = false, silent = true }
vim.keymap.set("n", "<F1>", "<cmd>lua require'dap'.continue()<CR>", opts)
vim.keymap.set("n", "<F2>", "<cmd>lua require'dap'.step_over()<CR>", opts)
vim.keymap.set("n", "<F3>", "<cmd>lua require'dap'.step_into()<CR>", opts)
vim.keymap.set("n", "<F4>", "<cmd>lua require'dap'.step_out()<CR>", opts)
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.terminate()<CR>", opts)
vim.keymap.set("n", "<F6>", "<cmd>lua require'dap'.run_last()<CR>", opts)
vim.keymap.set("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.keymap.set("n", "<leader>sj", "<cmd>lua require'dap'.down()<CR>", opts) -- <s>tack <j>down
vim.keymap.set("n", "<leader>sk", "<cmd>lua require'dap'.up()<CR>", opts) -- <s>tack <k>up
vim.keymap.set(
	"n",
	"<leader>B",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	opts
)
vim.keymap.set(
	"n",
	"<leader>lp",
	"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	opts
)

-- nvim-dap-ui
-- Add dapui to dap events. This will automatically launch dapui when the debugging starts
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

local pyadapter = require("dap").adapters.python
pyadapter.enrich_config = function(config, on_config)
	if not config.pythonPath and not config.python then
		local conda_venv_path = os.getenv("CONDA_PREFIX")
		if conda_venv_path then
			config.pythonPath = conda_venv_path .. "/bin/python"
			on_config(config)
		end
	end
end
