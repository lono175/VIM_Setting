set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

color ayende
set nu 	"enable line number
"set autoindent 	"indent
"OPTIONAL: This enables automatic indentation as you type.
filetype indent on
set nowrap "no line wrapping
"alt key does not active menu
set winaltkeys=no
set fdm=syntax "set folding rule to language syntax
set foldnestmax=3 "set fold level to 3 at max
"open all folds
set foldlevelstart=99
"set isfname+=32 "Vim to support filenames with spaces in when using gf, may break things
"
"To avoid getting the "Press ENTER" message whenever I open a file
set cmdheight=2
set tabstop=4  "tab stop for 4 spaces 
set shiftwidth=4
set expandtab "transform all tabs into spaces
"go to command mode
imap jj <Esc>

"set confirm  "show confirm dialogs when there are errors 
"Disable the backup file
"set nobackup 
"Disable swapfile, put everything in memory(will crash vim with big file)
"set noswapfile
" turn off annoying bell

set vb
" smartindent automatically inserts one extra level of indentation in some cases.
set smartindent
" Don't let swap and backup files fill my working directory.
set backupdir=c:\\temp,.        " Backup files
set directory=c:\\temp,.        " Swap files

"persistent undo for VIM 7.3 or above
set undodir=c:\\temp,.
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

set scrolloff=5                 " keep at least 5 lines around the cursor
set autoread                    " Reload the file when it has been modified
set wildmenu                    " Enable menu for file as below
set wildmode=longest,full       " Make :tabe matches longest common filename
set shortmess=atI               " Avoid The 'Press ENTER or type command to continue' 

"inserts the longest common text of all matches; and the menu will come up even if there's only one match
set completeopt=longest,menuone
"set completeopt=longest,menuone,preview

"Here is how to emulate Emacsˇ transpose-words in Vim
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<cr><c-o><c-l>:nohl<cr>

"If you like Y to work from the cursor to the end of line (which is more logical, but not Vi-compatible)
noremap Y y$

"Maximize window when start
"au Filetype cpp,c,cs,txt,viki,tex,m,rc,vim simalt ~x
au GUIEnter * simalt ~x

" restore the window
"simalt ~r

"disable mouse middle click(annoying when scrolling)
map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>


"This command simply overwrites the gf command to instead open the file under the cursor with the :edit commandand if it does not exist, then open a new empty buffer
"nmap gf :edit <cfile><CR>

"for FuzzyFinder.vim
"can I set default to open tabs??
"break the original forward functionality
"nmap ff :FuzzyFinderFile<CR> 
"nmap fw ::FuzzyFinderTag<CR>
nmap <Leader>g :FufFile<CR> 
nmap <Leader>f :FufTag<CR>
" MruFile is disabled by default
nmap <Leader>r :FufMruFile<CR>
inoremap <C-M-F10> <ESC> :FufTag<CR>
nmap <C-M-F10> :FufTag<CR>
inoremap <C-M-F11> <ESC> :FufFile<CR>
nmap <C-M-F11> :FufFile<CR>
"open the file in the current buffer
let g:fuf_keyOpen = '<C-l>'
"open the file in a new tab
let g:fuf_keyOpenTabpage = '<CR>'


"for ctag.vim
"c-tag remap, jump to previous tag
noremap <C-[> <C-t> 
"C-\ - Open the definition in a new tab, never use it
"map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"A-] - Open the definition in a vertical split, never use it
"map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"tabbed editing, not working
"map <C-t> <Esc>:tabnew<CR> 

"save all files
inoremap <silent> <C-s> <ESC>:wa<CR> 
nnoremap <silent> <C-s> :wa<CR>

"save all files and rebuild tag file
"need Sleep function to wait cs.py to rebuild cscope.out
au FileType cpp,c,java inoremap <silent> <C-s> <ESC> :wa<CR>:cs kill 0<CR>:!start cmd /c  cs.py<CR>:Sleep 1000<CR>:cs add cscope.out<CR>
au FileType cpp,c,java nnoremap <silent> <C-s> :wa<CR>:cs kill 0<CR>:!start cmd /c cs.py<CR>:Sleep 1000<CR>:cs add cscope.out<CR>

"disable cscope for python
au FileType python set nocst

"save all files for python, and rebuild tag file with ctags (TODO: switch to GNU Global when it supports python)
au FileType python inoremap <silent> <C-s> <ESC> :wa<CR>:cs kill 0<CR>:!start cmd /c  cs.py<CR>:!start cmd /c ctags -R --python-kinds=-i .<CR>:Sleep 1000<CR>:cs add cscope.out<CR>
au FileType python nnoremap <silent> <C-s> :wa<CR>:cs kill 0<CR>:!start cmd /c cs.py<CR>:!start cmd /c ctags -R --python-kinds=-i .<CR>:Sleep 1000<CR>:cs add cscope.out<CR>



"find the occurence in all files
"nnoremap <Leader>f :noautocmd vimgrep/\<<C-r><C-w>\>/j **/*.[ch] **/*.[ch]pp **/*.java **/*.pl **/*.rb **/*.py **/*.cs<CR>:cw<CR>
nnoremap <Leader>F :noautocmd vimgrep/\c/j **/*.[ch] **/*.[ch]pp **/*.tex **/*.java **/*.pl **/*.rb **/*.py **/*.cs **/*.m <left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>

"Keystroke Savor for Substituting all occurrences of the word under the cursor
"without question
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>
vmap <Leader>s y:execute "%s/".escape(@",'[]/')."//gI"<Left><Left><Left><Left>
"with question
nnoremap <Leader>S :%s/\<<C-r><C-w>\>//gcI<Left><Left><Left><Left>
vmap <leader>S y:execute "%s/".escape(@",'[]/')."//gcI"<left><left><left><left><Left>

"Then you can use Ctrl-NumPad+ to increment numbers as others do with <C-A> 
noremap <C-kPlus> <C-A>
noremap <C-kMinus> <C-X>
"failed try
"noremap <C-Char-61> <C-X>
"noremap <C-=> <C-A>
"noremap <C--> <C-X>

"for easy page down and page up, failed
"noremap <Space> <C-F> conflicted with FuzzyFinder
"noremap <BS> <C-B>

"Doxygen hot keys
"with @retval end
nnoremap <Leader>d :let g:DoxygenToolkit_returnTag="@retval "<CR>:Dox<CR>
"with @return end
nnoremap <Leader>D :let g:DoxygenToolkit_returnTag="@return "<CR>:Dox<CR>

"set pastetoggle=<F12> "it seems like gvim already handle this


"------------------------------omni-completion--------------------------------

"now the complete will match case-insensitive words
"set ignorecase 

"exclude boost directory for include complete since it takes TOO LONG
set include=^\\s*#\\s*include\ \\(<boost/\\)\\@!

"remember to build ctags file as below for omni-cpp-complete
"map <C-F12> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

"completion hotkeys
"default complete
"imap <M-F10> <c-x><c-p>
"make default complete to be longest common text of auto-complete
imap <M-F10> <ESC>:call MyDefaultComplete()<CR>
"file complete
imap <M-F9> <c-x><c-f>
"line complete
imap <C-M-F9> <c-x><c-l>

function MyDefaultComplete()
    call feedkeys("a\<c-x>\<c-p>")
endfunction
"------------------------------omni-completion--------------------------------

"------------------------------for cpp---------------------------------------
"for visual studio plugin
"save and compile the current file
au FileType cpp imap <C-F7> <ESC>:wa<CR>\ic
"save and compile and update ctags
au FileType cpp nmap <C-F7> :wa<CR>\ic:!start cmd /c "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."<CR> 
"save and build the current file
au FileType cpp imap <C-M-F12> <ESC>:wa<CR>\ib
"save and build and update ctags
au FileType cpp nmap <C-M-F12> :wa<CR>\ib:!start cmd /c "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."<CR> 

"for a.vim, insert mode, like tomato operation in vs2008
"imap <silent> <A-o> <ESC>:AT<CR> 
inoremap <Leader>t <ESC>:AT<CR>
"for a.vim, normal mode, like tomato operation in vs2008
nnoremap <Leader>t :AT<CR>
"nnoremap <silent> <A-o> :AT<CR> 

"EnhancedCommentify to comment source code, failed to map <C-/>, use autohotkey instead
let g:EnhCommentifyRespectIndent = 'Yes'
"If yes, you cannot type \c in insert mode, very annoying
let g:EnhCommentifyBindInInsert='No'
let g:EnhCommentifyFirstLineMode = 'Yes'

"let g:visual_studio_quickfix_height = 10
"map <C-/> <Plug>VisualTraditional
"map <C-h> <Plug>VisualTraditional

"set errorformat=\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %m "For QuickFix window to work on VS2008. Don't set it here, set it in VS2008 plugin

"-------------------------------------for C#---------------------------------
" Folding : http://vim.wikia.com/wiki/Syntax-based_folding, see comment by Ostrygen
"au FileType cs set omnifunc=syntaxcomplete#Complete
au FileType cs let g:SuperTabDefaultCompletionType = "<c-x><c-i>"
au FileType cs set foldmethod=marker
au FileType cs set foldmarker={,}
au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',)
au FileType cs set foldlevelstart=99  


"------------------------------for matlab------------------------------------------
au FileType matlab simalt ~x
au FileType matlab source $VIMRUNTIME/macros/matchit.vim
autocmd BufEnter *.m    compiler mlint

"------------------------------for python------------------------------------------
"au FileType python let g:pydiction_location = 'D:/ctags/python_diction/complete-dict'

"------------------------------for text files---------------------------------
au BufRead,BufNewFile *.txt setfiletype text
au FileType text set wrap linebreak textwidth=0
"add spell check
au FileType text setlocal spell spelllang=en

" use Firefox Style browse
"au FileType text nnoremap <Space> <C-F>
"au FileType text nnoremap <BS> <C-B>

"------------------------------for AsciiDoc-----------------------------------
au FileType asciidoc setlocal spell spelllang=en
au FileType text set wrap linebreak textwidth=0
" use Firefox Style browse
au FileType asciidoc nnoremap <Space> <C-F>
au FileType asciidoc nnoremap <BS> <C-B>
"asciidoc.py --unsafe --backend=xhtml11 --conf-file=layout1.conf --attribute icons --attribute imagesdir="./images" -v index.txt
"------------------------------for AsciiDoc-----------------------------------


"------------------------------vim-latex---------------------------------------
" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
au FileType tex set shellslash


" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*


" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'

"highlight the line longer than 100 character
au FileType tex :match DiffAdd '\%>100v.*'
"add spell check
au FileType tex setlocal spell spelllang=en
"------------------------------vim-latex---------------------------------------


"------------------------------unicode support---------------------------------------
"set guifont=Consolas:h11:cSHIFTJIS
"set guifont=*
set guifont=Consolas:h11
"set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
"set fileencodings = ascii, gbk, ucs-bom,utf-8,ucs-2,ucs-le,sjis,big5,latin1
set encoding=utf-8
set fileencoding=utf-8
set tenc=utf-8
set fileencodings=ucs-bom,utf-8,SHIFT-JIS,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"set fileencodings=ascii,ucs-bom,utf-8,ucs-2,ucs-le,sjis,big5,latin1

"fix 输几个☆★□■试试看 display problem
set ambiwidth=double

"since now vim internal coding is UTF8, we need to delete original menu and
"apply new coding of menu(utf-8). Otherwise, the menu cannot display
"correctly. It set menu to CHINESE!!!
"source $VIMRUNTIME/delmenu.vim
"language messages zh_TW.utf-8

"------------------------------unicode support---------------------------------------

"------------------------------delimitMate---------------------------------------
au FileType cpp let b:delimitMate_matchpairs = "(:),[:]"

"------------------------------neocomplcache---------------------------------------

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_manual_completion_start_length = 2
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" snippets expand key
imap  <silent><expr><tab>  neocomplcache#sources#snippets_complete#expandable() ? "\<plug>(neocomplcache_snippets_expand)" : (pumvisible() ? "\<c-e>" : "\<tab>")
smap  <tab>  <right><plug>(neocomplcache_snippets_jump)
inoremap <expr><c-e>     neocomplcache#complete_common_string()

" function for snippets
function Filename()
    return expand("%:t:r")
endfunction
"inoremap <expr><TAB> neocomplcache#plugin#snippets_complete#expandable() ? <Plug>(neocomplcache_snippets_expand) : neocomplcache#complete_common_string()
"smap <TAB> <Plug>(neocomplcache_snippets_expand)
"inoremap <expr><C-g> neocomplcache#undo_completion()
"inoremap <expr><C-l> pumvisible() ? "\<C-n>" : "\<C-l>"
" 途中でEnterしたとき、ポップアップを消して改行し、
" 改行を連続して入力してもインデント部を保持する
"inoremap <expr><CR> pumvisible() ? "\<C-y>\<CR>X\<BS>" : "\<CR>X\<BS>"
"------------------------------neocomplcache---------------------------------------


"------------------------------cscope---------------------------------------
if has("cscope")

  nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  if filereadable("cscope.out")
      cs add cscope.out
  endif
  "find all functions calling a certain function, usefull!!
  map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>

  "to find all occurrences of a particular C symbol
  map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>

endif



"------------------------------cscope---------------------------------------


set diffexpr=MyDiff()
function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            let cmd = '""' . $VIMRUNTIME . '\diff"'
            let eq = '"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg0 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


set nocp
filetype plugin on
"generate by D:\ctags>ctags -R --c++-kinds=+p-d-e --file-scope=no --fields=+iaS -f cv_tags --extra=+q d:\OpenCV2.0\src
"No macro, enum value and restricted to exported symbols
set tags+=D:\ctags\cv_tags
"generate by D:\ctags>ctags -R --c++-kinds=+p-d-e-m --file-scope=no --fields=+iaS -f cv_header_tags --extra=+q d:\OpenCV2.0\include\opencv
"set tags+=D:\ctags\cv_header_tags
"set path+=D:/OpenCV2.0/src
set path+=D:/OpenCV/include/opencv
set path+=D:/boost/boost_1_42

"set tags+=D:\ctags57\boost-tags



"a sleep function which allows vim to wait for the other processes to finish
com! -complete=command -nargs=+ Sleep call s:Sleep(<q-args>)
fun! s:Sleep(millisec)
    let ct = localtime()
    let dt = 0
    while dt < (a:millisec/1000)
        let dt = localtime() - ct
    endwhile
endfun

