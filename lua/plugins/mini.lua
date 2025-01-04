return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      require('mini.surround').setup()

      require('mini.notify').setup()

      require('mini.icons').setup()

      -- Simple and easy statusline.
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = true }

      statusline.section_location = function()
        return '%2l:%-2v'
      end
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
}
