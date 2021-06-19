-- Finish here if Packer was just bootstrapped
if require('plugins').bootstrap then
    return
end

-- Set completion options
vim.opt.completeopt = { 'menuone', 'noselect' }

-- Set up Compe plugin
require('compe').setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    resolve_timeout = 800,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
        path = true,
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
    },
}

-- Set Compe mappings
vim.cmd [[
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <cr>      compe#confirm('<cr>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
]]
