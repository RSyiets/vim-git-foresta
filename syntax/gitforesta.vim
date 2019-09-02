if exists("b:current_syntax")
    finish
endif

syn match gitforestaCommitId /^\x\{8}/
syn match gitforestaDateTime /\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}/
syn match gitforestaShaft /[│├─╮╯╭┤╰┴═]/
syn match gitforestaLeaf /[■●○◎]/
syn region gitforestaBranches start=/(\w/ end=/\w)/ oneline

hi def link gitforestaCommitId Identifier
hi def link gitforestaDateTime Define
hi def link gitforestaShaft Constant
hi def link gitforestaLeaf Label
hi def link gitforestaBranches Function

let b:current_syntax = "gitforesta"
