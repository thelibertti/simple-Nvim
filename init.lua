local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup({
  spec = {
    { import = "plugins" },
    --{ import = "usr_plugins"} --uncomment to use custom plugins
  },
  defaults = {
    lazy = false,
  },
  change_detection = {
    notify = false,
  },

})
