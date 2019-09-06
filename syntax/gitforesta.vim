if exists("b:current_syntax")
    finish
endif

syn match gitforestaCommitId /^\x\{8}/
syn match gitforestaDateTime /\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}/
syn match gitforestaShaft /[│├─╮╯╭┤╰┴═]/
syn match gitforestaLeaf /[■●○◎]/
syn region gitforestaBranch start=/ (\w/ end=/\w) / contains=gitforestaTag oneline keepend
syn region gitforestaTag start=/\%( (\|, \)\@<=tag: / end=/\w\%() \|, \)\@=/ oneline contained containedin=gitforestaBranch

hi gitforestaCommitId ctermfg=208 guifg=#FD971F
hi gitforestaDateTime ctermfg=81 guifg=#66D9EF
hi gitforestaShaft ctermfg=135 guifg=#AE81FF
hi gitforestaLeaf ctermfg=229 guifg=#E6DB74
hi gitforestaBranch ctermfg=118 guifg=#A6E22E
hi gitforestaTag ctermfg=170 guifg=#d75fd7

let b:current_syntax = "gitforesta"
