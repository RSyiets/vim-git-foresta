"==================================================
" vim-git-foresta
"==================================================
scriptencoding utf-8

let g:gitforesta#executable_path = '~/bin/git-foresta'

function! s:gitforesta_open() abort
  new
  execute 'r!' g:gitforesta#executable_path '--all --style=10'
  1;1delete
  call s:gitforesta_delete_ansi()
  call s:gitforesta_set_buf_options()
  call cursor(1,1)
  setlocal filetype=gitforesta

  map <buffer> <CR> :call <SID>gitforesta_show_commit_detail()<CR>
endfunction

function! s:gitforesta_show_commit_detail()
  let l:commit_id = s:gitforesta_get_selected_commit_id()
  if l:commit_id == '        '
    return
  endif

  new
  execute 'r! git show' l:commit_id
  1;1delete
  call s:gitforesta_set_buf_options()
  call cursor(1,1)
  setlocal filetype=gitshow
endfunction

function! s:gitforesta_set_buf_options()
    " Options for a non-file/control buffer.
    setlocal bufhidden=hide
    setlocal buftype=nofile
    setlocal noswapfile

    " Options for controlling buffer/window appearance.
    setlocal foldcolumn=0
    setlocal foldmethod=manual
    setlocal nobuflisted
    setlocal nofoldenable
    setlocal nolist
    setlocal nospell
    setlocal nowrap

    setlocal nomodifiable
endfunction

function! s:gitforesta_delete_ansi()
  silent!  %s/\[[0-9;]*m//g
endfunction

function! s:gitforesta_get_selected_commit_id()
  return getline('.')[0:7]
endfunction

command! -nargs=0 -complete=command GitForesta call <SID>gitforesta_open()

