-- Lazy.nvim configuration
--  ->  Bootstrap: Installs lazy.nvim if not present
--  ->  Plugin specs: Imports plugin configurations
local vim = vim

vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- Core plugin (plenary)
    { import = "plugins.init" },

    -- UI plugins: themes, dashboard, pickers, notifications
    { import = "plugins.ui" },

    -- Snacks.nvim: 
    { import = "plugins.snacks" },

    -- General plugins: completion, treesitter, formatting, productivity tools
    { import = "plugins.general" },

    -- Navigation plugins: file browsers, project management, search
    { import = "plugins.navigation" },

    -- Language-specific plugins: completion, snippets, and tool support
    { import = "plugins.language" },

    -- LSP/DAP: Language servers, debugging, and Mason package manager
    { import = "plugins.lsp-dap" },

    -- AI plugins: code completion and assistance
    { import = "plugins.ai" },
  },
  change_detection = {
    notify = false
  }
})
