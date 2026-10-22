return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        opts = {
            no_italic = false,
            styles = {
                comments = { "italic" },
                conditionals = { "italic" },
                functions = { "italic" },
                keywords = { "italic" },
                types = { "italic" },
            },
        },
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    {
        "olimorris/onedarkpro.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },

    -- TODO: Install gruvbox, nightowl
}
