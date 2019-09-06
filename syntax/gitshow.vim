if exists("b:current_syntax")
    finish
endif

syn match gitshowCommitId /^commit \x\{40}/
syn region gitshowHeader start=/@@/ end=/@@/ oneline
syn match gitshowAdded /^+.\{-,}$/
syn match gitshowRemoved /^-.\{-,}$/

hi gitshowCommitId ctermfg=229 guifg=#E6DB74
hi gitshowHeader ctermfg=81 guifg=#66D9EF
hi gitshowAdded ctermfg=118 guifg=#A6E22E
hi gitshowRemoved ctermfg=161 guifg=#F92672

let b:current_syntax = "gitshow"
