" Autor: Mikolaj Machowski <mikmach@wp.pl>
" File: French keys for TTCoach
" Last Change: wto lis 12 10:00  2002 C
 
scriptencoding iso-8859-1
" Function returns key for highlighting
function! ExtLayout(current_key) 
" Standard French layout {{{
	if g:ttcoach_layout == "fr"
		if a:current_key =~ "[a-z&�\"'*(�_��)=$�<;:!-]"
		   let curr_key = a:current_key
		elseif a:current_key =~ ' '
			let curr_key = '\s*space\s*'
		elseif a:current_key =~ "[AZERTQSDFGWXCVB]"
			let curr_key = tolower(a:current_key)
			syntax match ttCurrent /\[shiftr\]/
		elseif a:current_key =~ "[YUIOPHJKLMBN]"
			let curr_key = tolower(a:current_key)
			syntax match ttCurrent /\[shiftl\]/
		elseif a:current_key =~ '�'
			let curr_key = 'CR'
		" Special keys - in keyboard rows 
		" First row {{{
		elseif a:current_key =~ '1'
			let curr_key = '&'
			syntax match ttCurrent /\[shiftr\]/
		elseif a:current_key =~ '2'
			let curr_key = '�'
			syntax match ttCurrent /\[shiftr\]/
		elseif a:current_key =~ '\~'
			let curr_key = '�'
			syntax match ttCurrent /\[ altr\]/
		elseif a:current_key =~ '3'
			let curr_key = '"'
			syntax match ttCurrent /\[shiftr\]/
		elseif a:current_key =~ '#'
			let curr_key = '"'
			syntax match ttCurrent /\[ altr\]/
		elseif a:current_key =~ '4'
			let curr_key = "'"
			syntax match ttCurrent /\[shiftr\]/
		elseif a:current_key =~ '{'
			let curr_key = "'"
			syntax match ttCurrent /\[ altr\]/
		elseif a:current_key =~ '5'
			let curr_key = '('
			syntax match ttCurrent /\[shiftr\]/
		elseif a:current_key =~ '['
			let curr_key = '('
			syntax match ttCurrent /\[ altr\]/
		elseif a:current_key =~ '6'
			let curr_key = '-'
			syntax match ttCurrent /\[shiftr\]/
		elseif a:current_key =~ '|'
			let curr_key = '-'
			syntax match ttCurrent /\[ altr\]/
		elseif a:current_key =~ '7'
			let curr_key = '�'
			syntax match ttCurrent /\[shiftr\]/
		elseif a:current_key =~ '`'
			let curr_key = '�'
			syntax match ttCurrent /\[ altr\]/
		elseif a:current_key =~ '8' 
			let curr_key = '_'
			syntax match ttCurrent /\[shiftl\]/
		elseif a:current_key =~ '\\' 
			let curr_key = '_'
			syntax match ttCurrent /\[ altr\]/
		elseif a:current_key =~ '9'
			let curr_key = '�'
			syntax match ttCurrent /\[shiftl\]/
		elseif a:current_key =~ '\^'
			let curr_key = '�'
			syntax match ttCurrent /\[ altr\]/
		elseif a:current_key =~ '0'
			let curr_key = '�'
			syntax match ttCurrent /\[shiftl\]/
		elseif a:current_key =~ '@'
			let curr_key = '�'
			syntax match ttCurrent /\[ altr\]/
		elseif a:current_key =~ '�'
			let curr_key = ')'
			syntax match ttCurrent /\[shiftl\]/
		elseif a:current_key =~ ']'
			let curr_key = ')'
			syntax match ttCurrent /\[ altr\]/
		elseif a:current_key =~ '+'
			let curr_key = '='
			syntax match ttCurrent /\[shiftl\]/
		elseif a:current_key =~ '}'
			let curr_key = '='
			syntax match ttCurrent /\[ altr\]/
			" }}} 
		" Second row {{{
		elseif a:current_key =~ "\t"
			let curr_key = "\t"
			syntax match ttCurrent /\[tab \]/
		elseif a:current_key =~ '�'
			let curr_key = '$'
			syntax match ttCurrent /\[shiftl\]/
		elseif a:current_key =~ '�'
			let curr_key = '$'
			syntax match ttCurrent /\[ altrl\]/
			" }}}
		" Third row {{{
		elseif a:current_key =~ '%'
			let curr_key = '�'
			syntax match ttCurrent /\[shiftl\]/
		elseif a:current_key =~ '�'
			let curr_key = '*'
			syntax match ttCurrent /\[shiftl\]/
			" }}}
		" Fourth row {{{
		elseif a:current_key =~ '>'
			let curr_key = '<'
			syntax match ttCurrent /\[shiftr\]/
		elseif a:current_key =~ '?'
			let curr_key = ','
			syntax match ttCurrent /\[shiftl\]/
		elseif a:current_key =~ '\.'
			let curr_key = ';'
			syntax match ttCurrent /\[shiftl\]/
		elseif a:current_key =~ '\/'
			let curr_key = ':'
			syntax match ttCurrent /\[shiftl\]/
		elseif a:current_key =~ '�'
			let curr_key = '!'
			syntax match ttCurrent /\[shiftl\]/
		endif
		" }}}
	endif " }}}
endfunction

" Special imaps for French letters
" French letters {{{
if g:ttcoach_layout == "fr" 
	imap <silent> � �<c-o>:call CompareKeys()<cr>
	imap <silent> � �<c-o>:call CompareKeys()<cr>
	imap <silent> � �<c-o>:call CompareKeys()<cr>
	imap <silent> � �<c-o>:call CompareKeys()<cr>
	imap <silent> � �<c-o>:call CompareKeys()<cr>
	imap <silent> � �<c-o>:call CompareKeys()<cr>
	imap <silent> � �<c-o>:call CompareKeys()<cr>
	imap <silent> � �<c-o>:call CompareKeys()<cr>
	imap <silent> � �<c-o>:call CompareKeys()<cr>
	imap <silent> � �<c-o>:call CompareKeys()<cr>
	imap <silent> � �<c-o>:call CompareKeys()<cr>
endif
" }}}

" Description of finger keys
let g:l_little_keys = "\t�&12~><\"�aAqQ"
let g:l_ring_keys   = '3"#zZsSxX'
let g:l_middle_keys = "'4{eEdDcC"
let g:l_index_keys  = '(5[-6|rRtTfFgGvVbB'
let g:r_index_keys  = "�7`_8\\yYuUhHjJnN,?"
let g:r_middle_keys = '�9^iIkK;.'
let g:r_ring_keys   = '�0@oOlL:/'
let g:r_little_keys = ')�]=+}*�mM%�!�'
let g:thumb_keys = ' '
