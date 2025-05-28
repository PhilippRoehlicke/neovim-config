return {
  {
    -- See `:help gitsigns` to understand what the configuration keys do
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local neogit = require("neogit")
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      local function diff_with_selected_commit()
        require("telescope.builtin").git_commits({
          attach_mappings = function(_, map)
            map("i", "<CR>", function(prompt_bufnr)
              local entry = action_state.get_selected_entry()
              actions.close(prompt_bufnr)
              local commit = entry.value
              local file = vim.fn.expand("%")
              vim.cmd("DiffviewOpen " .. commit .. "^ -- " .. file)
            end)
            return true
          end,
        })
      end

      vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Open Neogit" })
      vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory<CR>", { desc = "Diffview history" })
      vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewFileHistory %<CR>", { desc = "Diffview history (file)" })
      vim.keymap.set("n", "<leader>gd", diff_with_selected_commit, { desc = "Diff with commit (file)" })
      vim.keymap.set("n", "<leader>gq", "<cmd>DiffviewClose<CR>", { desc = "Close Diffview" })

      neogit.setup({
        kind = "replace",
        disable_commit_confirmation = true,
        disable_insert_on_commit = false,
        integrations = {
          diffview = true,
          telescope = true,
        },
        graph_style = "unicode",
        signs = {
          section = { "", "" }, -- Removes the signs for sections
          item = { "", "" }, -- Removes the signs for items
          hunk = { "", "" }, -- Removes the signs for hunks
        },
      })
    end,
  },
}
