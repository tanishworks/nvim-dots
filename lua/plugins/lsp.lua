return {
    {
        "mason-org/mason.nvim",
        lazy = false,
        opts = {},
    },

    {
        {
            "mason-org/mason-lspconfig.nvim",
            opts = {
                ensure_installed = {
                    "lua_ls",
                    "basedpyright",
                    "ruff",
                    "clangd",
                    "ts_ls",
                    "tailwindcss",
                    "rust_analyzer",
                },
            },
            dependencies = {
                { "mason-org/mason.nvim", opts = {} },
                "neovim/nvim-lspconfig",
            },
        },
    },

    {
        {
            "neovim/nvim-lspconfig",
            event = { "BufReadPre", "BufNewFile" },
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
            },
            config = function()
                local capabilities = require("cmp_nvim_lsp").default_capabilities()

                vim.lsp.config("*", {
                    capabilities = capabilities,
                })

                vim.lsp.config("ts_ls", {
                    cmd = {
                        vim.fn.stdpath("data") .. "/mason/bin/typescript-language-server",
                        "--stdio",
                    },
                })

                vim.lsp.enable({
                    "tailwindcss",
                    "ruby_lsp",
                    "lua_ls",
                    "basedpyright",
                    "ruff",
                    "clangd",
                    "ts_ls",
                })
            end,
        },
    },
}
