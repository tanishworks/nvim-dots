require("nvim-treesitter").setup({})

local languages = { "lua", "rust", "javascript", "markdown", "markdown_inline" }
require("nvim-treesitter").install(languages)

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "rust", "javascript", "markdown" },
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
})
