-- Module
local plugins = { }

-- Declare plugins
local function setup()
    local use = require('packer').use

    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- Neovim Lua libraries
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    -- Hail tpope
    use 'tpope/vim-commentary'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'

    -- Colorschemes
    use 'marko-cerovac/material.nvim'
    use 'rafamadriz/neon'
    use { 'npxbr/gruvbox.nvim',
    requires = { 'rktjmp/lush.nvim' } }

    -- Statusline
    use { 'hoob3rt/lualine.nvim',
    requires = { 'tpope/vim-fugitive' } }

    -- Git sign column info
    use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' } }

    -- Telescope
    use { 'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' } }

    -- Dashboard
    use { 'glepnir/dashboard-nvim',
    requires = { 'nvim-telescope/telescope.nvim' } }

    -- Utilities
    use 'jghauser/mkdir.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'tweekmonster/startuptime.vim'
    use 'editorconfig/editorconfig-vim'

    -- Fern file manager
    use 'lambdalisue/fern.vim'
    use 'lambdalisue/fern-git-status.vim'
    use 'lambdalisue/fern-hijack.vim'
    use 'lambdalisue/fern-ssh'

    -- language support
    use 'neovim/nvim-lspconfig'
    use { 'msricher/nvim-lspinstall', branch = 'fortran' }
    use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate' }
    use 'juliaeditorsupport/julia-vim'
    use 'euclidianace/betterlua.vim'

    -- Completion
    use 'hrsh7th/nvim-compe'
end

-- Set up environment
local packer_url = 'https://github.com/wbthomason/packer.nvim'
local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- Check if the Packer plugin directory exists
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    -- If it doesn't exist, clone the Packer git repo and install it
    vim.fn.system { 'git', 'clone', packer_url, packer_path }
    vim.cmd 'packadd packer.nvim'
    -- Set the flag to indicate we just bootstrapped Packer
    plugins.bootstrap = true
else
    plugins.bootstrap = false
end

-- Load Packer
require('packer').startup(setup)

-- If Packer was just bootstrapped, run sync and print message
if plugins.bootstrap then
    require('packer').sync()
    print('Plugins configured. Restart nvim to finish installation.')
end

-- Return module
return plugins
