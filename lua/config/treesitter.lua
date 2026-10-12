-- local ts = require('nvim-treesitter.configs')
-- 
-- -- Highlighting for every supported filetype.
-- vim.api.nvim_create_autocmd("FileType", {
--   callback = function(args)
--     local buf = args.buf
-- 
--     if vim.treesitter.language.add(vim.bo[buf].filetype) then
--       vim.treesitter.start(buf)
--     end
--   end,
-- })
-- 
-- -- -- Tree-sitter folding.
-- -- vim.api.nvim_create_autocmd("FileType", {
-- --   callback = function()
-- --     vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- --     vim.wo.foldmethod = "expr"
-- --     vim.wo.foldlevel = 99
-- --   end,
-- -- })
-- 
-- ts.install({ 'lua', 'rust', 'javascript' })

local languages = { "lua", "rust", "javascript" }

require("nvim-treesitter").install(languages)

vim.api.nvim_create_autocmd("FileType", {
  pattern = languages,
  callback = function()
    -- Highlighting is provided by Neovim.
    vim.treesitter.start()

    -- Tree-sitter folding is provided by Neovim.
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo.foldlevel = 99

    -- Tree-sitter indentation is provided by the plugin and is experimental.
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
