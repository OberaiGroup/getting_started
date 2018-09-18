syntax on

set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

set number

set hlsearch

set showtabline=1

filetype plugin on

cnoreabbrev <expr> vrs ((getcmdtype() is# ':' && getcmdline() is# 'vrs')?('vertical resize'):('vrs'))

cnoreabbrev <expr> thisDir ((getcmdtype() is# ':' && getcmdline() is# 'thisDir')?('e %:p:h'):('thisDir'))

cnoreabbrev <expr> sthisDir ((getcmdtype() is# ':' && getcmdline() is# 'sthisDir')?('sp %:p:h'):('sthisDir'))

cnoreabbrev <expr> vthisDir ((getcmdtype() is# ':' && getcmdline() is# 'vthisDir')?('vsp %:p:h'):('vthisDir'))
