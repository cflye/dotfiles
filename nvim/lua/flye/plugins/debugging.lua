return {{
    "mfussenegger/nvim-dap",
    init = function()
        local dap = require("dap")
        local dapui = require("dapui")
        vim.notify("nvim-dap.lua")

        dap.adapters.coreclr = {
            type = "executable",
            command = "C:/Program Files (x86)/netcoredbg/netcoredbg.exe",
            args = {"--interpreter=vscode"}
        }

        -- TODO: check with rust how these should behave
        dap.defaults.fallback.terminal_win_cmd = 'tabnew'
        dap.defaults.fallback.focus_terminal = false

        dap.configurations.cs = {{
            type = "coreclr",
            name = "launch - netcoredbg",
            request = "launch",
            program = function()
                return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
            end
        }}

        dap.listeners.after.event_initialized["dapui_config"] = function()
            vim.notify("dap.listeners.after.event_initialized")
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

    end,
    dependencies = {
        "rcarriga/nvim-dap-ui",
        opts = {},

        keys = {{'<F5>', function()
            require('dap').continue()
        end}, {'<F10>', function()
            require('dap').step_over()
        end}, {'<F11>', function()
            require('dap').step_into()
        end}, {'<S-F11>', function()
            require('dap').step_out()
        end}, {'<Leader>tb', function()
            require('dap').toggle_breakpoint()
        end}, {'<Leader>tB', function()
            require('dap').set_breakpoint()
        end}, {'<Leader>tlp', function()
            require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
        end}, {'<Leader>dr', function()
            require('dap').repl.open()
        end}, {'<Leader>dl', function()
            require('dap').run_last()
        end}, {'<Leader>dh', function()
            require('dap.ui.widgets').hover()
        end}, -- todo: also visual mode !
        {'<Leader>dp', function()
            require('dap.ui.widgets').preview()
        end}, -- todo: also visual mode !
        {'<Leader>df', function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.frames)
        end}, {'<Leader>ds', function()
            local widgets = require('dap.ui.widgets')
            widgets.centered_float(widgets.scopes)
        end}}

    }

}}

