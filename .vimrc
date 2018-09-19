" Basic .vimrc to help make vi/vim more user friendly.
" Note that vi points to vim on all modern machines.
"
" A handy trick is to pass command line results to vim window; e.g.
"
" `vim <(ls /path/to/dir | grep foo)` 
"
" will open a vim window with the content of `dir` with string `foo`.

" Turn syntax coloring on, based on file extension.
syntax on

" Set tabs to be smart and have size of two spaces.
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Set line numbers to be shown on the left-hand-side of the screen.
set number

" Set searched strings to be highlighted. 
" Turn off with `:noh` for `no highlighting`.
set hlsearch

" Ensure tabline is shown. 
" The `tab` in `tabline` refers to multiple window, similar to a web browser's
" `tab`s.
" Create a new tab with `:tabn <fileName>`
" See stackoverflow for more on vim tabs.
set showtabline=1

" Envoke the filetype plugin.
" Used here to automatically set `set spell` for *.tex files.
filetype plugin on

" Abbreviate `:vertical resize <N>` to `:vrs <N>`.
cnoreabbrev <expr> vrs ((getcmdtype() is# ':' && getcmdline() is# 'vrs')?('vertical resize'):('vrs'))

" Create functions to access a file's directory instead of vim's working
" directory. 
" `:thisDir` replaces the current file window with a navigatable view of 
"  its directory
" `sthisDir` splits the current file window with a navigatable view of its
"  directory
" `vthisDir` vertically splits the current file window with a navigatable 
"  view of its directory
cnoreabbrev <expr> thisDir ((getcmdtype() is# ':' && getcmdline() is# 'thisDir')?('e %:p:h'):('thisDir'))
cnoreabbrev <expr> sthisDir ((getcmdtype() is# ':' && getcmdline() is# 'sthisDir')?('sp %:p:h'):('sthisDir'))
cnoreabbrev <expr> vthisDir ((getcmdtype() is# ':' && getcmdline() is# 'vthisDir')?('vsp %:p:h'):('vthisDir'))
