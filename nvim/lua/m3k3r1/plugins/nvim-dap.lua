return {
    -- Debug Adapter Protocol for Neovim
    {
        "mfussenegger/nvim-dap",
		ft = "go",  -- Load for Go files
    },
    -- Go support for nvim-dap
    {
        "leoluz/nvim-dap-go",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            require('dap-go').setup()
        end,
		ft = "go",  -- Load for Go files
    },
    -- UI for nvim-dap
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap"},
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            dapui.setup()  -- Make sure to setup dapui

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            local sign = vim.fn.sign_define
            
            sign('DapStopped', {text = '▶️', texthl = '', linehl = '', numhl = ''})
            sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
            sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
            sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
			-- Key mappings
			local keymap = vim.keymap.set
			keymap('n', '<F5>', dap.continue)
			keymap('n', '<F10>', dap.step_over)
			keymap('n', '<F11>', dap.step_into)
			keymap('n', '<F12>', dap.step_out)
			keymap('n', '<leader>b', dap.toggle_breakpoint)
		end,
		ft = "go",  -- Load for Go files
	},
}