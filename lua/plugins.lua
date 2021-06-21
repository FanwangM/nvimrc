-- Module
local plugins = { }

-- Function to declare plugins
local function setup()
    local use = require('packer').use

    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    -- tpope plugins -- must haves
    use 'tpope/vim-commentary'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'

    -- Colorscheme
    use 'sainnhe/gruvbox-material'

    -- Statusline
    use { 'hoob3rt/lualine.nvim', requires = { 'tpope/vim-fugitive' } }

    -- Git sign column info
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim', 'nvim-lua/popup.nvim' } }

    -- Completion
    use 'hrsh7th/nvim-compe'

    -- Dashboard
    use 'glepnir/dashboard-nvim'

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
    use 'juliaeditorsupport/julia-vim'
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

end

-- Function to load Packer
function plugins.startup()
    require('packer').startup(setup)
end

-- Check if the Packer plugin directory exists
local packer_url = 'https://github.com/wbthomason/packer.nvim'
local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
    -- If it doesn't exist, clone the Packer git repo and install it
    vim.fn.system { 'git', 'clone', packer_url, packer_path }
    vim.cmd 'packadd packer.nvim'
    -- Set the flag to indicate we just bootstrapped Packer
    plugins.bootstrap = true
else
    plugins.bootstrap = false
end

-- Return module
return plugins
