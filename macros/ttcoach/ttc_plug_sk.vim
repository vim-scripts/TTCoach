" Autor: Peter Valach <pvalach@gmx.net>
" File: Slovak keys for TTCoach
" Last Change: 2002/11/19
 
scriptencoding iso-8859-2
" Function returns key for highlighting
function! ExtLayout(current_key) 
	" Slovak layout {{{
	if a:current_key =~ "[abcdefghijklmnopqrstuvwxyz+��軾����=�����,-]"
		let curr_key = a:current_key
	elseif a:current_key == ' '
		let curr_key = '\s*space\s*'
	elseif a:current_key =~ "[QWERTASDFGYXCVB]"
		let curr_key = tolower(a:current_key)
		syntax match ttCurrent /\[shiftr\]/
	elseif a:current_key =~ "[ZUIOPHJKLNM]"
		let curr_key = tolower(a:current_key)
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key == '�'
		let curr_key = 'CR'
	" Special keys - in keyboard rows and something extra
	" First row {{{
	elseif a:current_key == '\~'
		let curr_key = ';'
		syntax match ttCurrent /\[shiftr\]/
	elseif a:current_key == '1'
		let curr_key = '+'
		syntax match ttCurrent /\[shiftr\]/
	elseif a:current_key == '2'
		let curr_key = '�'
		syntax match ttCurrent /\[shiftr\]/
	elseif a:current_key == '3'
		let curr_key = '�'
		syntax match ttCurrent /\[shiftr\]/
	elseif a:current_key == '4'
		let curr_key = '�'
		syntax match ttCurrent /\[shiftr\]/
	elseif a:current_key == '5'
		let curr_key = '�'
		syntax match ttCurrent /\[shiftr\]/
	elseif a:current_key == '6'
		let curr_key = '�'
		syntax match ttCurrent /\[shiftr\]/
	elseif a:current_key == '7'
		let curr_key = '�'
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key == '8'
		let curr_key = '�'
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key == '9'
		let curr_key = '�'
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key == '0'
		let curr_key = '�'
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key == '%'
		let curr_key = '='
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key == ')'
		let curr_key = '�'
		syntax match ttCurrent /\[shiftl\]/
		" }}} 
	" Second row {{{
	elseif a:current_key == "\t"
		let curr_key = "\t"
		syntax match ttCurrent /\[tab \]/
	elseif a:current_key == '/'
		let curr_key = '�'
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key == '('
		let curr_key = '�'
		syntax match ttCurrent /\[shiftl\]/
		" }}}
	" Third row {{{
	elseif a:current_key == '"'
		let curr_key = "�"
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key == '!'
		let curr_key = "�"
		syntax match ttCurrent /\[shiftl\]/
		" }}}
	" Fourth row {{{
	elseif a:current_key == '?'
		let curr_key = ','
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key =~ '\.'
		let curr_key = '\.'
	elseif a:current_key == ':'
		let curr_key = '\.'
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key == '_'
		let curr_key = '-'
		syntax match ttCurrent /\[shiftl\]/
	" }}}
	" Slovak letters in iso-8859-2 {{{
        " Dlzen {{{
	elseif a:current_key == '�'
		let curr_key = 'a'
		syntax match ttCurrent /\[shiftr\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'e'
		syntax match ttCurrent /\[shiftr\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'i'
		syntax match ttCurrent /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'l'
		syntax match ttCurrent /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'o'
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'o'
		syntax match ttCurrent /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'r'
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'r'
		syntax match ttCurrent /\[shiftr\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'u'
		syntax match ttCurrent /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'y'
		syntax match ttCurrent /\[shiftr\]/
		syntax match ttDead /\['\]/
	" }}}
        " Makcen a dvojbodka {{{
	elseif a:current_key == '�'
		let curr_key = 'a'
		syntax match ttCurrent /\[shiftr\]/
		syntax match ttDead /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'c'
		syntax match ttCurrent /\[shiftr\]/
		syntax match ttDead /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'd'
		syntax match ttDead /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'd'
		syntax match ttCurrent /\[shiftr\]/
		syntax match ttDead /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'e'
		syntax match ttDead /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'e'
		syntax match ttCurrent /\[shiftr\]/
		syntax match ttDead /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'l'
		syntax match ttDouble /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'n'
		syntax match ttDouble /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'o'
		syntax match ttDouble /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'r'
		syntax match ttDead /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'r'
		syntax match ttCurrent /\[shiftr\]/
		syntax match ttDead /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 's'
		syntax match ttCurrent /\[shiftr\]/
		syntax match ttDead /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 't'
		syntax match ttCurrent /\[shiftr\]/
		syntax match ttDead /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'u'
		syntax match ttDead /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'u'
		syntax match ttDouble /\[shiftl\]/
		syntax match ttDead /\['\]/
	elseif a:current_key == '�'
		let curr_key = 'z'
		syntax match ttDouble /\[shiftl\]/
		syntax match ttDead /\['\]/
	" }}}
	" }}}
	endif
	return curr_key
	" }}}
endfunction

" Special keymap settings for Slovak letters
set encoding=latin2
set iminsert=0
exe "source ".g:ttcoach_dir."ttcoach/ttc_plug_sk_keymap.vim"

" Description of finger keys
let g:l_little_keys = "\t;~+1�2qQaAyY"
let g:l_ring_keys   = '�3wWsSxX'
let g:l_middle_keys = '�4eEdDcC'
let g:l_index_keys  = '�5�6rRtTfFvVgGbB'
let g:r_index_keys  = '�7�8zZuUhHjJnNmM'
let g:r_middle_keys = '�9iIkK,?'
let g:r_ring_keys   = '�0oOlL.:'
let g:r_little_keys = "=%pP�/�(�)�\"�!-_"
let g:thumb_keys = ' '
