"==================================================
" vim-git-foresta
"==================================================
scriptencoding utf-8

function! s:gitforesta_open() abort
  if !exists('g:gitforesta#executable_path')
    echo 'git-foresta path is not specified'
    return
  endif

  if !executable(expand(g:gitforesta#executable_path))
    echo 'the path is not found:' g:gitforesta#executable_path
    return
  endif

  new
  execute 'r!' g:gitforesta#executable_path '--all --style=10'
  1;1delete
  call s:gitforesta_delete_ansi()
  call s:gitforesta_set_buf_options()
  call cursor(1,1)
  setlocal filetype=gitforesta

  map <buffer> <CR> :call <SID>gitforesta_show_commit_detail()<CR>
  map <buffer> C :call <SID>gitforesta_cherry_pick()<CR>
endfunction

function! s:gitforesta_show_commit_detail()
  let l:commit_id = s:gitforesta_get_selected_commit_id()
  if l:commit_id == ''
    echo
    return
  endif

  new
  execute 'r! git show' l:commit_id
  1;1delete
  call s:gitforesta_set_buf_options()
  call cursor(1,1)
  setlocal filetype=gitshow
endfunction

function! s:gitforesta_cherry_pick()
  let l:commit_id = s:gitforesta_get_selected_commit_id()
  if l:commit_id == ''
    echo
    return
  endif

  " Cherry pick the selected commit.
  silent! execute '!git cherry-pick' l:commit_id

  " Redraw git foresta.
  quit
  call s:gitforesta_open()
  redraw!
endfunction

function! s:gitforesta_set_buf_options()
    setlocal bufhidden=hide
    setlocal buftype=nofile
    setlocal noswapfile

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
  let l:commit_id = getline('.')[0:7]
  if l:commit_id == '        '
    return ''
  endif
  return l:commit_id
endfunction

command! -nargs=0 -complete=command GitForesta call <SID>gitforesta_open()
