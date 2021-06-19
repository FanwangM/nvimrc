-- Finish here if Packer was just bootstrapped
if require('plugins').bootstrap then
    return
end

---------
-- LSP --
---------

local lspconfig = require('lspconfig')
local lspinstall = require('lspinstall')

-- Servers managed by LspInstall
vim.g.managed_lsp_servers = {
    'bash',
    'cmake',
    'css',
    'fortran',
    'html',
    'json',
    'latex',
    'lua',
    'python',
    'vim',
    'yaml',
}

-- Locally installed servers
vim.g.local_lsp_servers = {
    'julials',
}

-- Lua server config
local lua_settings = {
    Lua = {
        runtime = {
            -- Use LuaJIT
            version = 'LuaJIT',
            path = vim.split(package.path, ';'),
        },
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
        },
        workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            },
        },
    },
}

-- Function to install managed servers
vim.cmd [[
function! LspInstallAll()
lua << EOF
for _, server in pairs(vim.g.managed_lsp_servers) do
    require('lspinstall').install_server(server)
end
EOF
endfunction

command! LspInstallAll exec 'call LspInstallAll()'
]]

-- Function to run on attaching server
local function on_attach(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    -- Set up omnifunc
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END]], false)
    end
end

-- Function to generate default config
local function make_config()
    return {
        capabilities = vim.lsp.protocol.make_client_capabilities(),
        on_attach = on_attach,
    }
end

-- Function to set up servers
local function setup_servers()
    -- Set up LspInstall
    lspinstall.setup()
    -- Add servers managed by LspInstall
    local servers = lspinstall.installed_servers()
    -- Add manually installed servers if executables exist
    for _, server in pairs(vim.g.local_lsp_servers) do
        table.insert(servers, server)
    end
    -- Set up servers
    for _, server in pairs(servers) do
        local config = make_config()
        if server == 'lua' then
            config.settings = lua_settings
        end
        lspconfig[server].setup(config)
    end
end

-- Automatically reload after `:LspInstall <server>`
lspinstall.post_install_hook = function ()
    setup_servers() -- reload installed servers
    vim.cmd 'bufdo e' -- trigger the FileType autocmd to start the server
end

-- Set up language servers
setup_servers()

----------------
-- Treesitter --
----------------

require('nvim-treesitter.configs').setup {
    ensure_installed = {
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
    },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = {
        enable = true,
    },
}
