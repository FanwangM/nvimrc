-- Get NVim version string
vim.cmd [[
function! NvimVersion()
redir => str
silent! version
redir END
return matchstr(str, 'NVIM \zs[^\n]*')
endfunction
]]

-- Clean up whitespace in buffer
vim.cmd [[
function! WhitespaceCleanup()
execute 'normal mz'
%s/\s\+$//ge
execute 'normal `z'
endfunction

command! WhitespaceCleanup exec 'call WhitespaceCleanup()'
]]
