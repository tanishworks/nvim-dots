vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.guifont = "JetBrainsMono Nerd Font"
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set rnu")
vim.cmd("set nu")

-- vim.cmd("set ch=0"); -- Sets cmdline height to 0

-- so it only shows when typing and removes lualine
-- I prefer using this manually by ":set ch=0" when I need to
-- so I keep this off

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
            -- TypeScript reports TS6133 as an unnecessary hint while ESLint
            -- reports the same unused declaration. Keep ESLint's diagnostic.
            if diagnostic.source == "typescript" and diagnostic.code == 6133 then
                return ""
            end
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
