-- lazy.nvim and plugin configs:
require("config.lazy");
require("config.treesitter");

-- vim options (gutter, tabstops, keybinds, colorschemes etc):
require("config.vim-options");
require("config.keymaps");
vim.cmd.colorscheme("dracula")

