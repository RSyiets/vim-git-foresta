if exists("b:current_syntax")
    finish
endif

syn match gitshowCommitId /^commit \x\{40}/
syn region gitshowHeader start=/@@/ end=/@@/ oneline
syn match gitshowAdded /^+.\{-,}$/
syn match gitshowRemoved /^-.\{-,}$/

hi def link gitshowCommitId Label
hi def link gitshowHeader Define
hi def link gitshowAdded Exception
hi def link gitshowRemoved Tag

let b:current_syntax = "gitshow"
