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
                ensure_installed = { 'lua_ls', 'rust_analyzer' },
            },
            dependencies = {
                { "mason-org/mason.nvim", opts = {} },
                "neovim/nvim-lspconfig",
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        lazy = false,
    },
}
