-- Enable built-in plugins
vim.cmd [[
syntax on
filetype plugin indent on
]]

-- Set options
vim.opt.autoindent = true
vim.opt.background = 'dark'
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.colorcolumn = { 101 }
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

-- New buffers default to text mode
vim.cmd 'autocmd BufNewFile,BufRead * setfiletype text'

-- Makefiles use tabs
vim.cmd 'autocmd FileType make setlocal noexpandtab'
