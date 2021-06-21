--------------------
-- Configure Nvim --
--------------------

-- Default Nvim syntax and filetype plugins
vim.cmd [[
syntax on
filetype plugin indent on

" New buffers should default to text mode
autocmd BufNewFile,BufRead * setfiletype text

" Makefiles should use tabs
autocmd FileType make setlocal noexpandtab
]]

-- Nvim settings
vim.opt.autoindent = true
vim.opt.background = 'dark'
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.colorcolumn = { 101 }
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.cursorline = true
vim.opt.display = 'lastline'
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.fileencoding = 'utf-8'
vim.opt.fileformats = { 'unix', 'dos', 'mac' }
vim.opt.formatoptions = 'jcroql1'
vim.opt.hidden = true
vim.opt.history = 10000
vim.opt.ignorecase = true
vim.opt.laststatus = 2
vim.opt.listchars = { eol = '$', tab = '>-', trail = '~', extends = '>', precedes = '<' }
vim.opt.matchtime = 5
vim.opt.mouse = 'a'
vim.opt.backup = false
vim.opt.errorbells = false
vim.opt.hlsearch = false
vim.opt.showmode = false
vim.opt.timeout = false
vim.opt.writebackup = false
vim.opt.number = true
vim.opt.scrolljump = 5
vim.opt.scrolloff = 5
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.shortmess = 'filnxtToOFactI'
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.signcolumn = 'number'
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.textwidth = 100
vim.opt.timeoutlen = 500
vim.opt.title = true
vim.opt.updatetime = 300
vim.opt.visualbell = true
vim.opt.wildignore = { '*.o', '*.obj', '*.so', '*.exe', '*swp', '*.class' }
vim.opt.wildmenu = true
vim.opt.wildmode = { 'full' }
vim.opt.wrap = true

---------------
-- Functions --
---------------

-- NVim version string
vim.cmd [[
function! NvimVersion()
redir => str
silent! version
redir END
return matchstr(str, 'NVIM \zs[^\n]*')
endfunction
]]

-- Clean up whitespace
vim.cmd [[
function! WhitespaceCleanup()
execute 'normal mz'
%s/\s\+$//ge
execute 'normal `z'
endfunction

command! WhitespaceCleanup exec 'call WhitespaceCleanup()'
]]

-------------
-- Plugins --
-------------

-- Configure Packer and plugins
require('plugins').startup()

-- Run :PackerSync if Packer was just bootstrapped
if require('plugins').bootstrap then
    require('packer').sync()
    print('Plugins configured. Restart nvim to finish installation.')
end

-----------------
-- LSP servers --
-----------------

vim.g.managed_lsp_servers = {
    'bash',
    'cmake',
    'css',
    'cpp',
    'fortran',
    'html',
    'json',
    'latex',
    'lua',
    'python',
    'vim',
    'yaml',
}

vim.g.local_lsp_servers = {
    'julials',
}

------------------------
-- Treesitter servers --
------------------------

vim.g.managed_treesitter_servers = {
    'bash',
    'bibtex',
    'c',
    'cpp',
    'css',
    'fortran',
    'html',
    'json',
    'julia',
    'latex',
    'lua',
    'python',
    'regex',
    'rst',
    'toml',
    'yaml',
}

-----------------
-- Local files --
-----------------

require('mappings')
require('interface')
require('languages')
