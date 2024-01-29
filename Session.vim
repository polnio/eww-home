let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +131 .config/eww-home/eww.yuck
badd +1 .local/bin/home_widgets
badd +2 .config/eww-home/assets/music/noArt.svg
badd +75 .config/eww-home/eww.scss
badd +3 .config/eww-home/scripts/music.sh
badd +1 .config/eww-home/scripts/agenda.sh
badd +10 .config/eww-home/scripts/backlight.sh
badd +1 oil:///home/polnio/.config/eww-home/
badd +3 .config/eww-home/scripts/music/sources.sh
argglobal
%argdel
$argadd oil:///home/polnio/.config/eww-home/
edit .config/eww-home/eww.yuck
argglobal
balt .config/eww-home/eww.scss
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 253 - ((39 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 253
normal! 036|
if exists(':tcd') == 2 | tcd ~/.config/eww-home | endif
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
