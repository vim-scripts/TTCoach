" Autor: Peter Valach <pvalach@gmx.net>
" File: Slovak keymap for TTCoach (required because of function mappings)
" Last Change: 2002/11/19
" (original keymap may be found at http://www.pv2c.sk/free/sk_vimkeymap/)

scriptencoding iso-8859-2
" Z a Y - ak chcete slovensku qwerty, zakomentujte tieto styri riadky
inoremap <silent> y z<c-o>:call CompareKeys()<cr>
inoremap <silent> z y<c-o>:call CompareKeys()<cr>
inoremap <silent> Y Z<c-o>:call CompareKeys()<cr>
inoremap <silent> Z Y<c-o>:call CompareKeys()<cr>

" Horny riadok
inoremap <silent> ` ;<c-o>:call CompareKeys()<cr>
inoremap <silent> 1 +<c-o>:call CompareKeys()<cr>
inoremap <silent> ! 1<c-o>:call CompareKeys()<cr>
inoremap <silent> 2 µ<c-o>:call CompareKeys()<cr>
inoremap <silent> @ 2<c-o>:call CompareKeys()<cr>
inoremap <silent> 3 ¹<c-o>:call CompareKeys()<cr>
inoremap <silent> # 3<c-o>:call CompareKeys()<cr>
inoremap <silent> 4 è<c-o>:call CompareKeys()<cr>
inoremap <silent> $ 4<c-o>:call CompareKeys()<cr>
inoremap <silent> 5 »<c-o>:call CompareKeys()<cr>
inoremap <silent> % 5<c-o>:call CompareKeys()<cr>
inoremap <silent> 6 ¾<c-o>:call CompareKeys()<cr>
inoremap <silent> ^ 6<c-o>:call CompareKeys()<cr>
inoremap <silent> 7 ý<c-o>:call CompareKeys()<cr>
inoremap <silent> & 7<c-o>:call CompareKeys()<cr>
inoremap <silent> 8 á<c-o>:call CompareKeys()<cr>
inoremap <silent> * 8<c-o>:call CompareKeys()<cr>
inoremap <silent> 9 í<c-o>:call CompareKeys()<cr>
inoremap <silent> ( 9<c-o>:call CompareKeys()<cr>
inoremap <silent> 0 é<c-o>:call CompareKeys()<cr>
inoremap <silent> ) 0<c-o>:call CompareKeys()<cr>
inoremap <silent> - =<c-o>:call CompareKeys()<cr>
inoremap <silent> _ %<c-o>:call CompareKeys()<cr>

" Klavesy okolo Enteru :)
inoremap <silent> [ ú<c-o>:call CompareKeys()<cr>
inoremap <silent> { /<c-o>:call CompareKeys()<cr>
inoremap <silent> ] ä<c-o>:call CompareKeys()<cr>
inoremap <silent> } (<c-o>:call CompareKeys()<cr>
inoremap <silent> \ ò<c-o>:call CompareKeys()<cr>
inoremap <silent> <Bar> )<c-o>:call CompareKeys()<cr>
inoremap <silent> ; ô<c-o>:call CompareKeys()<cr>
inoremap <silent> : "<c-o>:call CompareKeys()<cr>
inoremap <silent> ' §<c-o>:call CompareKeys()<cr>
inoremap <silent> " !<c-o>:call CompareKeys()<cr>
", , ;-)
inoremap <silent> < ?<c-o>:call CompareKeys()<cr>
". . ;-)
inoremap <silent> > :<c-o>:call CompareKeys()<cr>
inoremap <silent> / -<c-o>:call CompareKeys()<cr>
inoremap <silent> ? _<c-o>:call CompareKeys()<cr>

" Dlzne
inoremap <silent> =a á<c-o>:call CompareKeys()<cr>
inoremap <silent> =A Á<c-o>:call CompareKeys()<cr>
inoremap <silent> =e é<c-o>:call CompareKeys()<cr>
inoremap <silent> =E É<c-o>:call CompareKeys()<cr>
inoremap <silent> =i í<c-o>:call CompareKeys()<cr>
inoremap <silent> =I Í<c-o>:call CompareKeys()<cr>
inoremap <silent> =l å<c-o>:call CompareKeys()<cr>
inoremap <silent> =L Å<c-o>:call CompareKeys()<cr>
inoremap <silent> =o ó<c-o>:call CompareKeys()<cr>
inoremap <silent> =O Ó<c-o>:call CompareKeys()<cr>
inoremap <silent> =r à<c-o>:call CompareKeys()<cr>
inoremap <silent> =R À<c-o>:call CompareKeys()<cr>
inoremap <silent> =u ú<c-o>:call CompareKeys()<cr>
inoremap <silent> =U Ú<c-o>:call CompareKeys()<cr>
inoremap <silent> =z ý<c-o>:call CompareKeys()<cr>
inoremap <silent> =Z Ý<c-o>:call CompareKeys()<cr>
" pre pripad omylu :) alebo slovenskej QWERTY
inoremap <silent> =y ý<c-o>:call CompareKeys()<cr>
inoremap <silent> =Y Ý<c-o>:call CompareKeys()<cr>

" Makcene
inoremap <silent> +a ä<c-o>:call CompareKeys()<cr>
inoremap <silent> +A Ä<c-o>:call CompareKeys()<cr>
inoremap <silent> +c è<c-o>:call CompareKeys()<cr>
inoremap <silent> +C È<c-o>:call CompareKeys()<cr>
inoremap <silent> +d ï<c-o>:call CompareKeys()<cr>
inoremap <silent> +D Ï<c-o>:call CompareKeys()<cr>
inoremap <silent> +e ì<c-o>:call CompareKeys()<cr>
inoremap <silent> +E Ì<c-o>:call CompareKeys()<cr>
inoremap <silent> +l µ<c-o>:call CompareKeys()<cr>
inoremap <silent> +L ¥<c-o>:call CompareKeys()<cr>
inoremap <silent> +n ò<c-o>:call CompareKeys()<cr>
inoremap <silent> +N Ò<c-o>:call CompareKeys()<cr>
inoremap <silent> +o ô<c-o>:call CompareKeys()<cr>
inoremap <silent> +O Ô<c-o>:call CompareKeys()<cr>
inoremap <silent> +r ø<c-o>:call CompareKeys()<cr>
inoremap <silent> +R Ø<c-o>:call CompareKeys()<cr>
inoremap <silent> +s ¹<c-o>:call CompareKeys()<cr>
inoremap <silent> +S ©<c-o>:call CompareKeys()<cr>
inoremap <silent> +t »<c-o>:call CompareKeys()<cr>
inoremap <silent> +T «<c-o>:call CompareKeys()<cr>
inoremap <silent> +u ù<c-o>:call CompareKeys()<cr>
inoremap <silent> +U Ù<c-o>:call CompareKeys()<cr>
inoremap <silent> +y ¾<c-o>:call CompareKeys()<cr>
inoremap <silent> +Y ®<c-o>:call CompareKeys()<cr>
" pre pripad omylu :) alebo slovenskej QWERTY
inoremap <silent> +z ¾<c-o>:call CompareKeys()<cr>
inoremap <silent> +Z ®<c-o>:call CompareKeys()<cr>

