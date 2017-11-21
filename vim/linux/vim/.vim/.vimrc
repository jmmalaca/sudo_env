
call pathogen#infect()
filetype plugin indent on

let &t_Co=256
let t_Co=256
colorscheme Tomorrow-Night-Eighties
syntax on

set autoindent
set nocompatible

set encoding=utf-8
set list
set list listchars=tab:→\ ,trail:·,eol:¬
set tabstop=2
set ruler
set laststatus=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nowrap
set guioptions-=r
set guioptions-=l
set colorcolumn=80
set guioptions-=b
set guioptions-=T
set incsearch
set cursorline
set backspace=indent,eol,start
set showmatch
set nobackup
set noswapfile
set number
set autoread
set relativenumber

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['.git', '.hg', 'Rakefile']
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn))|(node_modules|vendor|coverage|target)$'
" use silver searcher
" http://robots.thoughtbot.com/faster-grepping-in-vim
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Show Marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_enable = 1
highlight ShowMarksHLl gui=bold guibg=LightBlue guifg=Blue
highlight ShowMarksHLu gui=bold guibg=LightRed guifg=DarkRed
highlight ShowMarksHLo gui=bold guibg=LightYellow guifg=DarkYellow
highlight ShowMarksHLm gui=bold guibg=LightGreen guifg=DarkGreen

" Omni complete on tab
function! SuperCleverTab()
  if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
    return "\<Tab>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=SuperCleverTab()<cr>

let mapleader = ","
map <Leader>m :Rmodel <CR>
map <Leader>c :Rcontroller <CR>
map <Leader>v :Rview <CR>
map <Leader>u :Runittest <CR>

" vim-ruby-test config
"let g:rubytest_in_quickfix = 1
let g:rubytest_cmd_test = "clear && ruby -Itest %p"
let g:rubytest_cmd_testcase = "clear && ruby -Itest %p -n '/%c/'"
let g:rubytest_cmd_spec = "clear && rspec %p --debug"
let g:rubytest_cmd_example = "clear && rspec %p -l %c --debug"
let g:rubytest_cmd_feature = "clear && cucumber %p"
let g:rubytest_cmd_story = "clear && cucumber %p -n '%c'"

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
end

autocmd BufNewFile,BufReadPost *.cljx setfiletype clojure
autocmd BufNewFile,BufReadPost *.cljc setfiletype clojure
autocmd BufNewFile,BufReadPost *.pxi setfiletype clojure
