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

dap.adapters.python = {
	type = "executable",
	command = vim.g.python3_host_prog,
	args = { "-m", "debugpy.adapter" },
}

local get_python_path = function()
	local conda_venv_path = os.getenv("CONDA_PREFIX")
	local venv_path = os.getenv("VIRTUAL_ENV")
	if venv_path then
		return venv_path .. "/bin/python"
	end
	if conda_venv_path then
		return conda_venv_path .. "/bin/python"
	end
	return nil
end

local setup_opts = {
	include_configs = false,
	console = "integratedTerminal",
	pythonPath = get_python_path(),
}
dap_python.setup(vim.g.python3_host_prog, setup_opts)

dapui.setup()

vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🟠", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "📂", texthl = "", linehl = "", numhl = "" })

-- :h dap-api
local opts = { remap = false, silent = true }
vim.keymap.set("n", "<F1>", "<cmd>lua require'dap'.continue()<CR>", opts)
vim.keymap.set("n", "<F2>", "<cmd>lua require'dap'.step_over()<CR>", opts)
vim.keymap.set("n", "<F3>", "<cmd>lua require'dap'.step_into()<CR>", opts)
vim.keymap.set("n", "<F4>", "<cmd>lua require'dap'.step_out()<CR>", opts)
vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.terminate()<CR>", opts)
vim.keymap.set("n", "<F6>", "<cmd>lua require'dap'.run_last()<CR>", opts)
vim.keymap.set("n", "<F7>", "<cmd>lua require'dap'.run_to_cursor()<CR>", opts)
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

require("dap.ext.vscode").load_launchjs()
