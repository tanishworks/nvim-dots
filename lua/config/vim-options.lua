vim.cmd("set expandtab");
vim.cmd("set tabstop=4");
vim.cmd("set softtabstop=4");
vim.cmd("set shiftwidth=4");
vim.opt.guifont = "JetBrains Mono:h14"

local diagnostic_severity = vim.diagnostic.severity
local diagnostic_labels = {
  [diagnostic_severity.ERROR] = "󰝤",
  [diagnostic_severity.WARN] = "󰹞",
  [diagnostic_severity.INFO] = "󰋽",
  [diagnostic_severity.HINT] = "󰌵",
}

vim.diagnostic.config({
  signs = false,
  underline = true,
  severity_sort = true,
  virtual_text = {
    spacing = 2,
    prefix = "",
    format = function(diagnostic)
      local label = diagnostic_labels[diagnostic.severity] or "Diagnostic"
      return ("%s %s"):format(label, diagnostic.message)
    end,
  },
})

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", {
  fg = "#f7768e",
  ctermfg = "Red",
  bold = true,
})
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", {
  fg = "#e0af68",
  ctermfg = "Yellow",
  bold = true,
})

