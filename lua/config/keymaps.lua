-- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<C-v>", '"+p', {
  desc = "Paste from system clipboard",
})

vim.keymap.set("i", "<C-v>", "<C-r>+", {
  desc = "Paste from system clipboard",
})

vim.keymap.set('n', '<leader>/', ':nohl<CR>')

vim.keymap.set('n', '<c-h>', ':TmuxNavigateLeft<CR>')
vim.keymap.set('n', '<c-j>', ':TmuxNavigateDown<CR>')
vim.keymap.set('n', '<c-k>', ':TmuxNavigateUp<CR>')
vim.keymap.set('n', '<c-l>', ':TmuxNavigateRight <CR>')

vim.keymap.set('n', '<leader>t', ':TestFile<CR>')
vim.keymap.set('n', '<leader>l', ':TestLast<CR>')

vim.keymap.set("n", "<Tab>", "gt", { desc = "Next tab" })
vim.keymap.set("n", "<S-Tab>", "gT", { desc = "Previous tab" })
vim.keymap.set("n", "<c-.>", "<c-w>>", { desc = "increase width" })
vim.keymap.set("n", "<c-,>", "<c-w><", { desc = "decrease width" })

-- Telescope --

-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>cs', builtin.colorscheme, { desc = 'Select colorscheme' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
-- -- replaced by snacks.nvim

-- LSP

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }
    local map = vim.keymap.set

    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gD", vim.lsp.buf.declaration, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "gi", vim.lsp.buf.implementation, opts)

    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    map("n", "<leader>gf", function()
      local clients = vim.lsp.get_clients({ bufnr = event.buf })

      local has_formatter = false

      for _, client in ipairs(clients) do
        if client:supports_method("textDocument/formatting") then
          has_formatter = true
          break
        end
      end

      if not has_formatter then
        vim.notify("No LSP formatter available", vim.log.levels.WARN)
        return
      end

      vim.lsp.buf.format({ async = true })
    end, vim.tbl_extend("force", opts, {
      desc = "Format buffer",
    }))

    map("n", "<leader>d", vim.diagnostic.open_float, opts)

    map("n", "[d", function()
      vim.diagnostic.jump({ count = -1 })
    end, opts)

    map("n", "]d", function()
      vim.diagnostic.jump({ count = 1 })
    end, opts)
  end,
})
