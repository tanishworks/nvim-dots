return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "3rd/image.nvim",
    },
    lazy = false, -- neo-tree will lazily load itself
    keys = {
        {
            "<leader>f<Right>",
            "<cmd>Neotree filesystem position=right toggle<cr>",
            desc = "J.A.R.V.I.S.: Neo-tree on your right, sir",
        },
        {
            "<leader>f<Left>",
            "<cmd>Neotree filesystem position=left toggle<cr>",
            desc = "J.A.R.V.I.S.: Neo-tree on your left, sir",
        },
    },
  }
}