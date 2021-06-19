-- Set key mappings
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Leader keys (use ';' as leader; remap ',' to ';')
vim.g.mapleader = ';'
vim.g.maplocalleader = '<C-;>'

-- Global mappings
map('', ',', ';')
map('', '<C-h>', '<cmd>wincmd h<cr>')
map('', '<C-j>', '<cmd>wincmd j<cr>')
map('', '<C-k>', '<cmd>wincmd k<cr>')
map('', '<C-l>', '<cmd>wincmd l<cr>')
map('n', '<C-Space>', '<C-b>')
map('n', '<Space>', '<C-f>')
map('v', '<C-Space>', '<C-b>')
map('v', '<Space>', '<C-f>')

-- Leader mappings
map('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>')
map('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>')
map('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>')
map('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').oldfiles()<cr>')
map('n', '<leader>fn', '<cmd>enew<cr>')
map('n', '<leader>tc', '<cmd>lua require(\'telescope.builtin\').colorscheme()<cr>')
map('n', '<leader>sl', '<cmd>SessionLoad<cr>')
map('n', '<leader>sn', '<cmd>set number!<cr>')
map('n', '<leader>sr', '<cmd>set relativenumber!<cr>')
map('n', '<leader>ss', '<cmd>SessionSave<cr>')
map('n', '<leader>wc', '<cmd>WhitespaceCleanup<cr>')
map('n', '<leader>wl', '<cmd>set list!<cr>')
