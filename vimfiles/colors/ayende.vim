" Vim color file
" Maintainer: Hai-Feng Kao <KHaiFeng@gmail.com>
" Last Change: 2009/06/28
" Info: based on ayende's visual studio setting 
" Version: 1.0

set background=dark
if version > 580
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="ayende"

hi User1 guibg=darkblue guifg=yellow
hi User2 guibg=darkblue guifg=lightblue
hi User3 guibg=darkblue guifg=red
hi User4 guibg=darkblue guifg=cyan
hi User5 guibg=darkblue guifg=lightgreen
set statusline=%<%1*===\ %5*%f%1*%(\ ===\ %4*%h%1*%)%(\ ===\ %4*%m%1*%)%(\ ===\ %4*%r%1*%)\ ===%====\ %2*%b(0x%B)%1*\ ===\ %3*%l,%c%V%1*\ ===\ %5*%P%1*\ ===%0* laststatus=2


hi Normal		guifg=#8CE6FF	guibg=#000000
"hi Normal		guifg=#87dee0	guibg=#000000
"hi Normal		guifg=#98fb98	guibg=#000000
hi Cursor		guibg=khaki		guifg=slategrey
hi Comment		guifg=#00FF00
"hi Identifier	guifg=#98FB98
hi Identifier	guifg=#8CE6FF
"123456
hi Constant		guifg=#FF8080
"hi String		guifg=#87cee0
" abcd
hi String		guifg=#D896CD
" 'c'
hi Character	guifg=#D896CD
"if, goto , rteturn
hi Statement	guifg=#FFC9A0 gui=NONE
"#define
hi PreProc		guifg=#B5B5FB
"namespace
hi Type			guifg=#FFC9A0 gui=NONE
hi Todo			guifg=orangered	guibg=yellow2
"hi Special		guifg=Orange
"%d, %s
hi Special		guifg=#D896CD
"hi Visual		guifg=SkyBlue	guibg=grey60		gui=none
hi Visual		guifg=#FFFFFF   guibg=#3399FF		gui=none
hi IncSearch	guifg=#FFFFFF	guibg=#3399FF		gui=none
hi Search		guifg=#434E54	guibg=#BFCDDB		gui=none
hi Ignore		guifg=grey40

hi VertSplit	guibg=#c2bfa5	guifg=grey50		gui=none
"hi Folded		guibg=grey30	guifg=gold
hi Folded		guibg=#000000   guifg=#808080
hi FoldColumn	guibg=grey30	guifg=tan
hi ModeMsg		guifg=goldenrod
hi MoreMsg		guifg=SeaGreen
hi NonText		guifg=LightBlue	guibg=#000000
hi Question		guifg=springgreen
hi SpecialKey	guifg=yellowgreen
"highlight StatusLine    guifg=Black   guibg=#aabbee gui=bold ctermfg=Black ctermbg=White  cterm=bold
highlight StatusLineNC  guifg=#444444 guibg=#aaaaaa gui=none ctermfg=Black ctermbg=Grey   cterm=none
"hi StatusLineNC	guibg=Black guifg=White gui=bold
"hi StatusLine	guibg=Black guifg=White gui=none
hi Title		guifg=indianred
hi WarningMsg	guifg=salmon
hi LineNr       guifg=#2B91AF	guibg=#000000

"a beautiful violet color for pop up menu
hi Pmenu    guibg=#600080 gui=NONE
"hi Pmenu    guibg=darkmagenta gui=NONE

" these are from desert ... i didn't change it
" color terminal definitions
hi SpecialKey	 ctermfg=darkgreen
hi NonText	 cterm=bold ctermfg=darkblue
hi Directory	 ctermfg=darkcyan
hi ErrorMsg	 cterm=bold ctermfg=7 ctermbg=1
hi IncSearch	 cterm=NONE ctermfg=yellow ctermbg=green
hi Search	 cterm=NONE ctermfg=grey ctermbg=blue
hi MoreMsg	 ctermfg=darkgreen
hi ModeMsg	 cterm=NONE ctermfg=brown
hi LineNr	 ctermfg=3
hi Question	 ctermfg=green
hi StatusLine	 cterm=bold,reverse
hi StatusLineNC  cterm=reverse
hi VertSplit	 cterm=reverse
hi Title	 ctermfg=5
hi Visual	 cterm=reverse
hi VisualNOS	 cterm=bold,underline
hi WarningMsg	 ctermfg=1
hi WildMenu	 ctermfg=0 ctermbg=3
hi Folded	 ctermfg=darkgrey ctermbg=NONE
hi FoldColumn	 ctermfg=darkgrey ctermbg=NONE
hi DiffAdd	 ctermbg=4
hi DiffChange	 ctermbg=5
hi DiffDelete	 cterm=bold ctermfg=4 ctermbg=6
hi DiffText	 cterm=bold ctermbg=1
hi Comment	 ctermfg=darkcyan
hi Constant	 ctermfg=brown
hi Special	 ctermfg=5
hi Identifier	 ctermfg=6
hi Statement	 ctermfg=3
hi PreProc	 ctermfg=5
hi Type		 ctermfg=2
hi Underlined	 cterm=underline ctermfg=5
hi Ignore	 cterm=bold ctermfg=7
hi Error	 cterm=bold ctermfg=7 ctermbg=1

"vim: sw=4
