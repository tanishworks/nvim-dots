return {
    {
        "xiyaowong/transparent.nvim",
        lazy = false,
        config = function()
            require("transparent").setup({
                extra_groups = {
                    "NormalFloat",
                    "FloatBorder",
                    "NvimTreeNormal",
                    "StatusLine",
                    "StatusLineNC",
                    "lualine_c_normal",
                    "lualine_c_insert",
                    "lualine_c_visual",
                    "lualine_c_replace",
                    "lualine_c_command",
                    "lualine_c_inactive",
                },
            })

            require("transparent").clear_prefix("NeoTree")
            -- require("transparent").clear_prefix("lualine")
        end,
    },
}

