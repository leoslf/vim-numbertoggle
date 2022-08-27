" vim-numbertoggle - Automatic toggling between 'hybrid' and absolute line numbers
" Maintainer:        <https://jeffkreeftmeijer.com>
" Version:           2.1.2

let g:numbertoggle_enabled = 0

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && g:numbertoggle_enabled == 1 && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu && g:numbertoggle_enabled == 1                  | set nornu | endif
augroup END

function! ToggleNumberToggle()
    let g:numbertoggle_enabled = xor(g:numbertoggle_enabled, 1)
    if (g:numbertoggle_enabled)
        set rnu
    else
        set nornu
    endif
endfunction

nnoremap <silent> <C-n> :call ToggleNumberToggle()<CR>
