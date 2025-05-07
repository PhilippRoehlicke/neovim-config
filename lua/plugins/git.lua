return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local neogit = require("neogit")

      vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Open Neogit" })

      neogit.setup({
        disable_commit_confirmation = true,
        disable_insert_on_commit = false,
        integrations = {
          diffview = true,
          telescope = true,
        },
      })
    end,
  },
}
