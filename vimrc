""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: amix the lucky stiff
"             http://amix.dk - amix@amix.dk
"
" Version: 3.6 - 25/08/10 14:40:30
"
" Blog_post: 
"       http://amix.dk/blog/post/19486#The-ultimate-vim-configuration-vimrc
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
" Raw_version: 
"       http://amix.dk/vim/vimrc.txt
"
" How_to_Install_on_Unix:
"    $ mkdir ~/.vim_runtime
"    $ svn co svn://orangoo.com/vim ~/.vim_runtime
"    $ cat ~/.vim_runtime/install.sh
"    $ sh ~/.vim_runtime/install.sh <system>
"      <sytem> can be `mac`, `linux` or `windows`
"
" How_to_Upgrade:
"    $ svn update ~/.vim_runtime
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Command mode related
"    -> Moving around, tabs and buffers
"    -> Statusline
"    -> Parenthesis/bracket expanding
"    -> General Abbrevs
"    -> Editing mappings
"
"    -> Cope
"    -> Minibuffer plugin
"    -> Omni complete functions
"    -> JavaScript section
"
"
" Plugins_Included:
"     > minibufexpl.vim - http://www.vim.org/scripts/script.php?script_id=159
"       Makes it easy to get an overview of buffers:
"           info -> :e ~/.vim_runtime/plugin/minibufexpl.vim
"
"     > surround.vim - http://www.vim.org/scripts/script.php?script_id=1697
"       Makes it easy to work with surrounding text:
"           info -> :help surround
"
"     > snipMate.vim - http://www.vim.org/scripts/script.php?script_id=2540
"       Snippets for many languages (similar to TextMate's):
"           info -> :help snipMate
"
"     > fuzzyfinder - http://www.vim.org/scripts/script.php?script_id=1984
"       Find files fast (similar to TextMate's feature):
"           info -> :help fuzzyfinder@en
"
"  Revisions:
"     > 3.6: Added lots of stuff (colors, Command-T, Vim 7.3 persistent undo etc.)
"     > 3.5: Paste mode is now shown in status line  if you are in paste mode
"     > 3.4: Added mru.vim
"     > 3.3: Added syntax highlighting for Mako mako.vim 
"     > 3.2: Turned on python_highlight_all for better syntax
"            highlighting for Python
"     > 3.1: Added revisions ;) and bufexplorer.vim
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pathogen config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#runtime_append_all_bundles()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! MySys()
return "linux"
endfun

" Sets how many lines of history VIM has to remember
set history=300

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <Leader>w :w<CR>

" Fast editing of the .vimrc
map <Leader>e :e! ~/.vimrc<CR>
" When vimrc is edited, reload it
autocmd! bufwritepost ~/.vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7
set wildmenu "Turn on WiLd menu
set ruler "Always show current position
set cmdheight=2 "The commandbar height
set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

set shell=/bin/bash

" Show line number
set nu
" Show underline on column 81 and more by c/cpp/python
au BufRead,BufNewFile *.c,*.cpp,*.py match UnderLined /.\%>81v/

if has("gui_running")
set guifont=Monaco\ 9
set guifontwide=iYahei\ 9
set guioptions-=T
set guioptions-=m
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
endif

set t_Co=256
set background=dark
colorscheme peaksea

set encoding=utf8
try
lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set nowrap "Do not wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Really useful!
"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>


function! CmdLine(str)
exe "menu Foo.Bar :" . a:str
emenu Foo.Bar
unmenu Foo
endfunction 

" From an idea by Michael Naumann
function! VisualSearch(direction) range
let l:saved_reg = @"
execute "normal! vgvy"

let l:pattern = escape(@", '\\/.*$^~[]')
let l:pattern = substitute(l:pattern, "\n$", "", "")

if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
endif

let @/ = l:pattern
let @" = l:saved_reg
endfunction



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

func! Cwd()
let cwd = getcwd()
return "e " . cwd 
endfunc

func! DeleteTillSlash()
let g:cmd = getcmdline()
if MySys() == "linux" || MySys() == "mac"
let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
else
let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
endif
if g:cmd == g:cmd_edited
if MySys() == "linux" || MySys() == "mac"
  let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
else
  let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
endif
endif   
return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
return a:cmd . " " . expand("%:p:h") . "/"
endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <leader><cr> :noh<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <Right> :bn<cr>
map <Left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit 
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
let l:currentBufNum = bufnr("%")
let l:alternateBufNum = bufnr("#")

if buflisted(l:alternateBufNum)
 buffer #
else
 bnext
endif

if bufnr("%") == l:currentBufNum
 new
endif

if buflisted(l:currentBufNum)
 execute("bdelete! ".l:currentBufNum)
endif
endfunction

" Specify the behavior when switching between buffers 
try
set switchbuf=usetab
set stal=1
catch
endtry


""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c


function! CurDir()
let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
return curdir
endfunction

function! HasPaste()
if &paste
    return 'PASTE MODE  '
else
    return ''
endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
map 0 ^

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if MySys() == "mac"
nmap <D-j> <M-j>
nmap <D-k> <M-k>
vmap <D-j> <M-j>
vmap <D-k> <M-k>
endif

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
exe "normal mz"
%s/\s\+$//ge
exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

set guitablabel=%t

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>


""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 4
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow=1

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

map <F4> :TMiniBufExplorer<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd") && exists("+omnifunc")
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS 
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags 
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS 
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete 
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags 

    autocmd FileType *
        \   if &omnifunc == "" |
        \       setlocal omnifunc=syntaxcomplete#Complete |       
        \   endif
endif

let OmniCpp_NamespaceSearch = 2
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_SelectFirstItem = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript setl fen
au FileType javascript setl nocindent


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn .git generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

map <leader>pp :setlocal paste!<cr>
"Generate the help tags
"helptags ~/.vim/doc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Richard Ma's configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse settings
set mouse=a

"--------------------------------------------------------------
" About .c and .cpp
"--------------------------------------------------------------
" Shortcut for generating ctags
map <F8> :!ctags -RV -I __THROW --langmap=c:+.h --languages=c,c++ --c-kinds=+px --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Load tags for standard C and UNIX
au FileType c set tags+=~/.vim/tags_stdc
au FileType c set tags+=/usr/include/tags

"Key mapping for compiling and running C programs.
au FileType c,cpp map <F6> :w<CR>:!gcc -Wall -lm % -o %<<CR>
au FileType c,cpp map <F5> :!./%<<CR>

"--------------------------------------------------------------
" About .pas pascle
"--------------------------------------------------------------
"Key mapping for compiling and running C programs.
au FileType pascal map <F6> :!fpc %<CR>
au FileType pascal map <F5> :!./%<<CR>

"--------------------------------------------------------------
" About tex 
"--------------------------------------------------------------
"Key mapping for compiling and watching LaTeX scripts.
au FileType tex map <F6> :!pdflatex %<CR>
au FileType tex map <F5> :!evince %<.pdf >/dev/null 2>&1 &<CR>

"--------------------------------------------------------------
" About reStructText
"--------------------------------------------------------------
"Key mapping for compiling and watching LaTeX scripts.
au FileType rst map <F6> :!make latex && cd ./_build/latex/ && xelatex *.tex<CR>
au FileType rst map <F5> :!evince ./_build/latex/*.pdf >/dev/null 2>&1 &<CR>

"--------------------------------------------------------------
" About vimwiki 
"--------------------------------------------------------------
au FileType vimwiki setl wrap

if has("gui_running")
    "Maximize the window for GUI
    set lines=65 columns=160

    " Use Alt-l, Alt-h in the GUI mode to move between buffers
    map <M-l> :bn<cr>
    map <M-h> :bp<cr>
endif

let g:vimwiki_list = [{
\ 'path': '~/Personal/wiki/src',
\ 'path_html': '~/Personal/wiki/',
\ 'auto_export': 1,
\ 'diary_link_count': 5,
\ 'html_header': '~/Personal/wiki/src/header.tpl',
\ 'html_footer': '~/Personal/wiki/src/footer.tpl'}]

"vimwiki global options
let g:vimwiki_camel_case = 0
let g:vimwiki_html_header_numbering = 2
let g:vimwiki_html_header_numbering_sym = '.'
let g:vimwiki_folding = 1
let g:vimwiki_fold_lists = 1

"vimwiki mappings
map <Leader>wf <Plug>VimwikiFollowLink
map <Leader>we <Plug>VimwikiSplitLink
map <Leader>wq <Plug>VimwikiVSplitLink
map <Leader>wb <Plug>VimwikiGoBackLink
map <Leader>wn <Plug>VimwikiNextLink
map <Leader>wp <Plug>VimwikiPrevLink
map <Leader>wd <Plug>VimwikiDeleteLink
map <Leader>wr <Plug>VimwikiRenameLink
map <Leader>wm <Plug>VimwikiToggleListItem

"Calendar
map <Leader>wc :Calendar<CR>

"Search and replace the word under the cursor
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>

"My Custom keys 
noremap <C-i> <C-]>
noremap <C-c> "+
noremap <C-a> ggVG

" Fuzzyfinder Key bindings
let g:fuf_modesDisable = []
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_enumeratingLimit = 20

nnoremap <silent> sf     :FufCoverageFile!<CR>
nnoremap <silent> sF     :FufFile!<CR>
nnoremap <silent> st     :FufTag!<CR>
nnoremap <silent> sT     :FufTagWithCursorWord!<CR>
nnoremap <silent> sj     :FufBuffer!<CR>
nnoremap <silent> so     :FufBufferTag!<CR>
nnoremap <silent> si     :FufBookmarkDir<CR>
nnoremap <silent> sI     :FufBookmarkDirAdd<CR>
nnoremap <silent> sq     :FufQuickfix<CR>


"Zencoding
let g:user_zen_settings = {'xml' : {'extends': 'html',}, 'jsp' : {'extends': 'html',}, 'php' : {'extends': 'html', 'filters': 'c', }, }
let g:use_zen_complete_tag = 1

"NERD tree
map <Leader>tt :NERDTreeToggle<CR>
let g:NERDChristmasTree = 1
let g:NERDTreeHighlightCursorline = 1

"NERD commenter
map <Leader>cb :'<,'>call NERDComment(1, 'sexy')<CR>

"Taglist
map <Leader>tl :TlistToggle<CR>
let g:Tlist_Ctags_Cmd = '/usr/bin/ctags'
let g:Tlist_Auto_Highlight_Tag = 1
let g:Tlist_Use_Right_Window = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Show_One_File = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1
let g:Tlist_Sort_type = "name"

"SnipMate
let g:snips_author = "Richard Ma (richard_ma)"
let g:snips_email = "richard.ma.19850509@gmail.com"

"neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_min_keyword_length = 3
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
"neocomplcache dictionary settings
let g:neocomplcache_dictionary_filetype_lists = {
    \   'default' : '~/.vim/dict/user_info.dict',
    \   'c'       : '~/.vim/dict/tags_stdc.dict'
\ }

"surround
xmap <Leader>s <Plug>Vsurround
