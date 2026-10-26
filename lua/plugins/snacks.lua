return {
    "folke/snacks.nvim",
    dependencies = {
        "echasnovski/mini.icons",
    },
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true },
        --    dashboard = {
        --      enabled = true,
        --      preset = {
        --        header = [[
        --                                              
        --       ████ ██████           █████      ██
        --      ███████████             █████ 
        --      █████████ ███████████████████ ███   ███████████
        --     █████████  ███    █████████████ █████ ██████████████
        --    █████████ ██████████ █████████ █████ █████ ████ █████
        --  ███████████ ███    ███ █████████ █████ █████ ████ █████
        -- ██████  █████████████████████ ████ █████ █████ ████ ██████
        --        ]],
        --      },
        --    },
        indent = { enabled = true },
        input = { enabled = true },
        git = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = true },
    },
    keys = {
        { "<leader>sf", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer", },
        { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer", },
        { "<leader>gl", function() Snacks.lazygit.log_file() end, desc = "Lazygit Log (cwd)", },
        { "<leader>lg", function() Snacks.lazygit() end, desc = "Lazygit", },
        { "<leader>ff", function() Snacks.picker.pick("files") end, desc = "Find Files", },
        { "<leader>fh", function() Snacks.explorer({ layout = { layout = { position = "left" } } }) end, desc = "File Explorer (left)", },
        { "<leader>fl", function() Snacks.explorer({ layout = { layout = { position = "right" } } }) end, desc = "File Explorer (right)", },
        { "<leader><leader>", function() Snacks.picker.recent() end, desc = "Recent Files", },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers", },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep Files", },
        { "<C-n>", function() Snacks.explorer() end, desc = "Explorer", },
        { "<leader>cs", function() Snacks.picker.colorschemes() end, desc = "Colorschemes", },
    },
}
