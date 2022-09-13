local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "july-24",
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}
-- -- -- -- -- -- -- -- -- -- --

-- Plugins to install -- 
return packer.startup(function(use)
  -- Plugin Mangager
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Lua Development
  use "nvim-lua/plenary.nvim" -- Useful lua functions used in lots of plugins
  use "nvim-lua/popup.nvim" -- Enables Popup's

  -- My Plugins --
  -- General
  use "ap/vim-css-color" -- Color highlights css

  -- Colorscheme
  use "folke/tokyonight.nvim" -- Tokyonight syntax colors
  use "gruvbox-community/gruvbox" -- Gruvbox syntax colors
  use "overcache/NeoSolarized" -- NeoSolarized syntax colors
  use "Mofiqul/dracula.nvim" -- Dracula syntax colors
  -- use "dylanaraps/wal" -- Grabs colors from WAL

  
  -- LSP
  use "neovim/nvim-lspconfig" -- Enable LSP
  use "williamboman/nvim-lsp-installer" -- Simple to use language server installer

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
