-- lazy.nvim and plugin configs:
require("config.lazy");
vim.cmd.colorscheme("tokyonight")
require("config.treesitter");

-- vim options (gutter, tabstops, keybinds, colorschemes etc):
require("config.vim-options");
require("config.keymaps");
-- LSP Test:
-- asdf.cmd.colorscheme("onedark");

