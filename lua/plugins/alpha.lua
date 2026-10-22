return {
    {
        "goolord/alpha-nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local startify = require("alpha.themes.startify")

            startify.file_icons.provider = "devicons"
            -- startify.mru_sections = { "mru" } -- only show recent files and not files within the project
            startify.section.header.val = {
                [[                                                                     ]],
                [[       ████ ██████           █████      ██                     ]],
                [[      ███████████             █████                             ]],
                [[      █████████ ███████████████████ ███   ███████████   ]],
                [[     █████████  ███    █████████████ █████ ██████████████   ]],
                [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
                [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
                [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            }

            -- local jokes = {
            --     "Why do programmers prefer dark mode? Because light attracts bugs.",
            --     "There are 10 types of people: those who understand binary and those who don't.",
            --     "I would tell you a UDP joke, but you might not get it.",
            --     "There's no place like 127.0.0.1.",
            --     "To understand recursion, you must first understand recursion.",
            -- }
            -- local joke = jokes[vim.fn.rand() % #jokes + 1]
            -- startify.section.footer.val = {
            --     {
            --         type = "text",
            --         val = joke,
            --         opts = { hl = "Comment", position = "center" },
            --     },
            -- }

            startify.config.layout[1].val = function()
                local recent_files = require("alpha.utils").get_mru(
                    nil,
                    10,
                    startify.mru_opts.ignore
                )
                local content_height = 30 + #recent_files

                return math.max(0, vim.api.nvim_win_get_height(0) - content_height)
            end

            require("alpha").setup(startify.config)
        end,
    },
}
