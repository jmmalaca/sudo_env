" colorscheme railscasts

set guifont=Monaco:h12

" Fix for ubuntu's vim ugly font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monospace\ 10
  endif
  set lines=999 columns=999
endif

set background=dark
colorscheme solarized

:au FocusLost * :wa

":au BufEnter * :hi Normal guibg=blue
" au BufLeave * :hi Normal guibg=#002b36
