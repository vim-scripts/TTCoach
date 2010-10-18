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
inoremap <silent> 2 �<c-o>:call CompareKeys()<cr>
inoremap <silent> @ 2<c-o>:call CompareKeys()<cr>
inoremap <silent> 3 �<c-o>:call CompareKeys()<cr>
inoremap <silent> # 3<c-o>:call CompareKeys()<cr>
inoremap <silent> 4 �<c-o>:call CompareKeys()<cr>
inoremap <silent> $ 4<c-o>:call CompareKeys()<cr>
inoremap <silent> 5 �<c-o>:call CompareKeys()<cr>
inoremap <silent> % 5<c-o>:call CompareKeys()<cr>
inoremap <silent> 6 �<c-o>:call CompareKeys()<cr>
inoremap <silent> ^ 6<c-o>:call CompareKeys()<cr>
inoremap <silent> 7 �<c-o>:call CompareKeys()<cr>
inoremap <silent> & 7<c-o>:call CompareKeys()<cr>
inoremap <silent> 8 �<c-o>:call CompareKeys()<cr>
inoremap <silent> * 8<c-o>:call CompareKeys()<cr>
inoremap <silent> 9 �<c-o>:call CompareKeys()<cr>
inoremap <silent> ( 9<c-o>:call CompareKeys()<cr>
inoremap <silent> 0 �<c-o>:call CompareKeys()<cr>
inoremap <silent> ) 0<c-o>:call CompareKeys()<cr>
inoremap <silent> - =<c-o>:call CompareKeys()<cr>
inoremap <silent> _ %<c-o>:call CompareKeys()<cr>

" Klavesy okolo Enteru :)
inoremap <silent> [ �<c-o>:call CompareKeys()<cr>
inoremap <silent> { /<c-o>:call CompareKeys()<cr>
inoremap <silent> ] �<c-o>:call CompareKeys()<cr>
inoremap <silent> } (<c-o>:call CompareKeys()<cr>
inoremap <silent> \ �<c-o>:call CompareKeys()<cr>
inoremap <silent> <Bar> )<c-o>:call CompareKeys()<cr>
inoremap <silent> ; �<c-o>:call CompareKeys()<cr>
inoremap <silent> : "<c-o>:call CompareKeys()<cr>
inoremap <silent> ' �<c-o>:call CompareKeys()<cr>
inoremap <silent> " !<c-o>:call CompareKeys()<cr>
", , ;-)
inoremap <silent> < ?<c-o>:call CompareKeys()<cr>
". . ;-)
inoremap <silent> > :<c-o>:call CompareKeys()<cr>
inoremap <silent> / -<c-o>:call CompareKeys()<cr>
inoremap <silent> ? _<c-o>:call CompareKeys()<cr>

" Dlzne
inoremap <silent> =a �<c-o>:call CompareKeys()<cr>
inoremap <silent> =A �<c-o>:call CompareKeys()<cr>
inoremap <silent> =e �<c-o>:call CompareKeys()<cr>
inoremap <silent> =E �<c-o>:call CompareKeys()<cr>
inoremap <silent> =i �<c-o>:call CompareKeys()<cr>
inoremap <silent> =I �<c-o>:call CompareKeys()<cr>
inoremap <silent> =l �<c-o>:call CompareKeys()<cr>
inoremap <silent> =L �<c-o>:call CompareKeys()<cr>
inoremap <silent> =o �<c-o>:call CompareKeys()<cr>
inoremap <silent> =O �<c-o>:call CompareKeys()<cr>
inoremap <silent> =r �<c-o>:call CompareKeys()<cr>
inoremap <silent> =R �<c-o>:call CompareKeys()<cr>
inoremap <silent> =u �<c-o>:call CompareKeys()<cr>
inoremap <silent> =U �<c-o>:call CompareKeys()<cr>
inoremap <silent> =z �<c-o>:call CompareKeys()<cr>
inoremap <silent> =Z �<c-o>:call CompareKeys()<cr>
" pre pripad omylu :) alebo slovenskej QWERTY
inoremap <silent> =y �<c-o>:call CompareKeys()<cr>
inoremap <silent> =Y �<c-o>:call CompareKeys()<cr>

" Makcene
inoremap <silent> +a �<c-o>:call CompareKeys()<cr>
inoremap <silent> +A �<c-o>:call CompareKeys()<cr>
inoremap <silent> +c �<c-o>:call CompareKeys()<cr>
inoremap <silent> +C �<c-o>:call CompareKeys()<cr>
inoremap <silent> +d �<c-o>:call CompareKeys()<cr>
inoremap <silent> +D �<c-o>:call CompareKeys()<cr>
inoremap <silent> +e �<c-o>:call CompareKeys()<cr>
inoremap <silent> +E �<c-o>:call CompareKeys()<cr>
inoremap <silent> +l �<c-o>:call CompareKeys()<cr>
inoremap <silent> +L �<c-o>:call CompareKeys()<cr>
inoremap <silent> +n �<c-o>:call CompareKeys()<cr>
inoremap <silent> +N �<c-o>:call CompareKeys()<cr>
inoremap <silent> +o �<c-o>:call CompareKeys()<cr>
inoremap <silent> +O �<c-o>:call CompareKeys()<cr>
inoremap <silent> +r �<c-o>:call CompareKeys()<cr>
inoremap <silent> +R �<c-o>:call CompareKeys()<cr>
inoremap <silent> +s �<c-o>:call CompareKeys()<cr>
inoremap <silent> +S �<c-o>:call CompareKeys()<cr>
inoremap <silent> +t �<c-o>:call CompareKeys()<cr>
inoremap <silent> +T �<c-o>:call CompareKeys()<cr>
inoremap <silent> +u �<c-o>:call CompareKeys()<cr>
inoremap <silent> +U �<c-o>:call CompareKeys()<cr>
inoremap <silent> +y �<c-o>:call CompareKeys()<cr>
inoremap <silent> +Y �<c-o>:call CompareKeys()<cr>
" pre pripad omylu :) alebo slovenskej QWERTY
inoremap <silent> +z �<c-o>:call CompareKeys()<cr>
inoremap <silent> +Z �<c-o>:call CompareKeys()<cr>

