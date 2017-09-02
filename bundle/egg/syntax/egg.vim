
if exists("b:current_syntax")
    finish
endif

syntax keyword eggKeyword do while
highlight link eggKeyword Keyword

syntax keyword eggFunction print fun
highlight link eggFunction Function

syntax match eggComment "\v#.*$"
highlight link eggComment Comment

syntax match eggNumber "\v[0-9]+"
highlight link eggNumber Number

syntax region eggString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region eggString start=/\v'/ skip=/\v\\./ end=/\v'/
highlight link eggString String

syntax keyword eggBoolean true false
highlight link eggBoolean Boolean
 "+,-,*,/,==,<,>

syntax match eggOperator "\v\*"
syntax match eggOperator "\v/"
syntax match eggOperator "\v\+"
syntax match eggOperator "\v-"
syntax match eggOperator "\v\=\="
syntax match eggOperator "\v\<"
syntax match eggOperator "\v\>"
highlight link eggOperator Operator

syntax keyword eggIdentifier define
highlight link eggIdentifier Identifier
let b:current_syntax = "egg"
