return {
  -- { 'github/copilot.vim' },
  {
    "olimorris/codecompanion.nvim",
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup({
        adapters = {
          anthropic = function()
            return require("codecompanion.adapters").extend("anthropic", {
              env = {
                model = "claude-3-7-sonnet-latest",
              },
            })
          end,
        },
        strategies = {
          chat = {
            adapter = "anthropic",
          },
          inline = {
            adapter = "anthropic",
          },
        },
      })

      vim.keymap.set("n", "<leader>ac", "<cmd>CodeCompanionChat<CR>", { desc = "[A]I [C]hat" })
      vim.keymap.set("n", "<leader>at", "<cmd>CodeCompanionChat Toggle<CR>", { desc = "[A]I [T]oggle" })
      vim.keymap.set("v", "<leader>ad", "<cmd>CodeCompanionChat Add<CR>", { desc = "[A]I a[d]d" })
      vim.keymap.set("n", "<leader>aa", "<cmd>CodeCompanionActions<CR>", { desc = "[A]I Actions" })
    end,
  },
  {
    "echasnovski/mini.diff",
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        source = diff.gen_source.none(),
      })
    end,
  },
}
