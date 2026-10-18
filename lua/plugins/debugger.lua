return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "mfussenegger/nvim-dap-python",
            {
                "jay-babu/mason-nvim-dap.nvim",
                dependencies = {
                    { "mason-org/mason.nvim", opts = {} },
                },
            },
            {
                "mxsdev/nvim-dap-vscode-js",
                opts = {
                    debugger_cmd = { "js-debug-adapter" },
                    adapters = { "pwa-node", "pwa-chrome" },
                },
            },
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            require("dapui").setup()
            require("mason-nvim-dap").setup({
                ensure_installed = { "python", "codelldb", "js" },
                automatic_installation = true,
            })
            require("dap-python").setup("debugpy-adapter")

            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = "codelldb",
                    args = { "--port", "${port}" },
                },
            }

            local cpp_configurations = {
                {
                    name = "Launch C/C++ executable",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = {},
                },
                {
                    name = "Launch C/C++ executable with arguments",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = false,
                    args = function()
                        return vim.split(vim.fn.input("Arguments: "), " ", { trimempty = true })
                    end,
                },
            }
            dap.configurations.cpp = cpp_configurations
            dap.configurations.c = cpp_configurations

            dap.configurations.typescript = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch current TypeScript file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                    sourceMaps = true,
                },
                {
                    type = "pwa-chrome",
                    request = "launch",
                    name = "Launch web app in Chrome",
                    url = "http://localhost:3000",
                    webRoot = "${workspaceFolder}",
                },
            }
            dap.configurations.javascript = dap.configurations.typescript
            dap.configurations.typescriptreact = dap.configurations.typescript
            dap.configurations.javascriptreact = dap.configurations.typescript

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })
            vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP: Continue" })
            vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "DAP: Step over" })
            vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP: Step into" })
            vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "DAP: Step out" })
            vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "DAP: Toggle REPL" })
            vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "DAP: Terminate" })
            vim.keymap.set("n", "<leader>dh", dapui.toggle, { desc = "DAP: Toggle UI" })

            local function build_and_run_cpp()
                local source = vim.fn.expand("%:p")
                local filetype = vim.bo.filetype
                local compiler = filetype == "c" and "gcc" or "g++"
                local build_dir = vim.fn.stdpath("cache") .. "/nvim-build"
                vim.fn.mkdir(build_dir, "p")

                local executable = build_dir .. "/" .. vim.fn.sha256(source):sub(1, 12)
                local command = table.concat({
                    vim.fn.shellescape(compiler),
                    "-g -O0",
                    vim.fn.shellescape(source),
                    "-o",
                    vim.fn.shellescape(executable),
                    "&&",
                    vim.fn.shellescape(executable),
                }, " ")

                vim.cmd("botright 12new")
                vim.fn.termopen({ "sh", "-c", command })
                vim.cmd("startinsert")
            end

            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "c", "cpp" },
                callback = function(event)
                    vim.keymap.set("n", "<leader>cb", build_and_run_cpp, {
                        desc = "Build and run C/C++ file",
                        buffer = event.buf,
                    })
                end,
            })
        end,
    },
}
