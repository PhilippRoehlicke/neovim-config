-- [[ install `lazy.nvim` plugin manager ]]
-- see `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ configure and install plugins ]]
--  to check the current status of your plugins or update, run
--    :lazy
--    :lazy update
--
-- note: here is where you install your plugins.
-- plugins can be added with a link (or for a github repo: 'owner/repo' link).

-- note: plugins can also be added by using a table,
-- with the first argument being the link and the following
-- keys can be used to configure plugin behavior/loading/etc.
--
-- note: plugins can also be configured to run lua code when they are loaded.
--
-- note: plugins can specify dependencies.
-- the dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
require("lazy").setup({
  { import = "plugins" },
}, {
  ui = {
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
