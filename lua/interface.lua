-- Finish here if Packer was just bootstrapped
if require('plugins').bootstrap then
    -- Set a built-in colorscheme
    vim.cmd 'colorscheme slate'
    return
end

-----------------
-- Colorscheme --
-----------------

vim.cmd 'colorscheme gruvbox'

-----------------
-- Status Line --
-----------------

require('lualine').setup {
    options = {
        theme = 'gruvbox',
        icons_enabled = false,
        component_separators = { '', '' },
        section_separators = { '', '' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
    inactive_sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
    extensions = { 'fugitive', 'quickfix' },
}

-----------------
-- Sign Column --
-----------------

require('gitsigns').setup {
    numhl = true,
    signs = {
        add = { hl = 'GitSignsAdd', text = '+', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change = { hl = 'GitSignsChange', text = '|', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
    },
}

---------------
-- Dashboard --
---------------

-- Menu item space + map leader key --------------------------------------------
local dashboard_line = '                                    ' .. vim.g.mapleader

-- Menu items
vim.g.dashboard_custom_section = {
    a = {
        description = {'New File    ' .. dashboard_line .. ' f n'},
        command = "enew",
    },
    b = {
        description = {'Find File   ' .. dashboard_line .. ' f f'},
        command = "Telescope find_files",
    },
    c = {
        description = {'Grep Files  ' .. dashboard_line .. ' f g'},
        command = "Telescope live_grep",
    },
    d = {
        description = {'Recent Files' .. dashboard_line .. ' f h'},
        command = "Telescope oldfiles",
    },
}

-- Header graphic (Fraktur font, from http://patorjk.com/software/taag/)
vim.g.dashboard_custom_header = {
    '',
    '',
    '                 _            .',
    '                u            @88>',
    '   u.    u.    88Nu.   u.    %8P      ..    .     :',
    ' x@88k u@88c. \'88888.o888c    .     .888: x888  x888.',
    '^"8888""8888"  ^8888  8888  .@88u  ~`8888~\'888X`?888f`',
    '  8888  888R    8888  8888 \'\'888E`   X888  888X \'888>',
    '  8888  888R    8888  8888   888E    X888  888X \'888>',
    '  8888  888R    8888  8888   888E    X888  888X \'888>',
    '  8888  888R   .8888b.888P   888E    X888  888X \'888>',
    ' "*88*" 8888"   ^Y8888*""    888&   "*88%""*88" \'888!`',
    '   ""   \'Y"       `Y"        R888"    `~    "    `"`',
    '                              ""',
}

-- Footer with version info
vim.g.dashboard_custom_footer = { vim.fn.NvimVersion() }

-- Buffer local mappings
vim.cmd [[
autocmd FileType dashboard map <buffer><nowait><silent> q <cmd>quit<cr>
autocmd FileType dashboard map <buffer><nowait><silent> Q <cmd>quit<cr>
autocmd FileType dashboard map <buffer><nowait><silent> i <cmd>enew <bar> startinsert<cr>
autocmd FileType dashboard map <buffer><nowait><silent> I <cmd>enew <bar> startinsert<cr>
autocmd FileType dashboard map <buffer><nowait><silent> <insert> <cmd>enew <bar> startinsert<cr>
]]

-----------
-- Mkdir --
-----------

require('mkdir')

---------------
-- Colorizer --
---------------

require('colorizer').setup()
