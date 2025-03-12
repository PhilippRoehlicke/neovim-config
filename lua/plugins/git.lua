return {

  {
    "tpope/vim-fugitive",
    cmd = { "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
    keys = {
      { "<leader>gs", ":Git<CR>",        desc = "Git status" },
      { "<leader>gd", ":Gdiffsplit<CR>", desc = "Git diff" },
    },
  },
}
