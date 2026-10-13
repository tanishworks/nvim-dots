-- lazy.nvim and plugin configs:
require("config.lazy");
require("config.treesitter");

-- vim options (gutter, tabstops, keybinds, colorschemes etc):
vim.cmd.colorscheme("onedark")
require("config.vim-options");
require("config.keymaps");
