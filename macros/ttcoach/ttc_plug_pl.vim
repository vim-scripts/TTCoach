" Autor: Mikolaj Machowski <mikmach@wp.pl>
" File: Polish keys for TTCoach
" Last Change: wto lis 12 10:00  2002 C
 
scriptencoding iso-8859-2
" Function returns key for highlighting
function! ExtLayout(current_key) 
	" Polish layout {{{
	if a:current_key =~ "[a-z0-9`;',=-]"
	   let curr_key = a:current_key
	elseif a:current_key =~ ' '
		let curr_key = '\s*space\s*'
	elseif a:current_key =~ "[QWERTASDFGZXCVB]"
		let curr_key = tolower(a:current_key)
		syntax match ttCurrent /\[shiftr\]/
	elseif a:current_key =~ "[YUIOPHJKLNM]"
		let curr_key = tolower(a:current_key)
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key =~ '�'
		let curr_key = 'CR'
	" Special keys - in keyboard rows and something extra
	" First row {{{
	elseif a:current_key =~ '\~'
		let curr_key = '`'
		syntax match ttCurrent /\[shiftr\]/
	elseif a:current_key =~ '!'
		let curr_key = '1'
		syntax match ttCurrent /\[shiftr\]/
	elseif a:current_key =~ '@'
		let curr_key = '2'
		syntax match ttCurrent /\[shiftr\]/
	elseif a:current_key =~ '#'
		let curr_key = '3'
		syntax match ttCurrent /\[shiftr\]/
	elseif a:current_key =~ '\$'
		let curr_key = '4'
		syntax match ttCurrent /\[shiftr\]/
	elseif a:current_key =~ '%'
		let curr_key = '5'
		syntax match ttCurrent /\[shiftr\]/
	elseif a:current_key =~ '\^'
		let curr_key = '6'
		syntax match ttCurrent /\[shiftr\]/
	elseif a:current_key =~ '&'
		let curr_key = '7'
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key =~ '*'
		let curr_key = '8'
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key =~ '('
		let curr_key = '9'
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key =~ ')'
		let curr_key = '0'
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key =~ '_'
		let curr_key = '-'
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key =~ '+'
		let curr_key = '='
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key =~ '\\'
		let curr_key = '\\'
	elseif a:current_key =~ '|'
		let curr_key = '\\'
		syntax match ttCurrent /\[shiftl\]/
		" }}} 
	" Second row {{{
	elseif a:current_key =~ "\t"
		let curr_key = "\t"
		syntax match ttCurrent /\[tab \]/
	elseif a:current_key =~ '['
		let curr_key = '\['
	elseif a:current_key =~ ']'
		let curr_key = '\]'
	elseif a:current_key =~ '{'
		let curr_key = '\['
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key =~ '}'
		let curr_key = '\]'
		syntax match ttCurrent /\[shiftl\]/
		" }}}
	" Third row {{{
	elseif a:current_key =~ ':'
		let curr_key = ";"
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key =~ '"'
		let curr_key = "'"
		syntax match ttCurrent /\[shiftl\]/
		" }}}
	" Fourth row {{{
	elseif a:current_key =~ '<'
		let curr_key = ','
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key =~ '\.'
		let curr_key = '\.'
	elseif a:current_key =~ '>'
		let curr_key = '\.'
		syntax match ttCurrent /\[shiftl\]/
	elseif a:current_key =~ '\/'
		let curr_key = '\/'
	elseif a:current_key =~ '?'
		let curr_key = '\/'
		syntax match ttCurrent /\[shiftl\]/
	" }}}
	" Polish letters in iso-8859-2 {{{
	elseif a:current_key =~ '�'
		let curr_key = 'a'
		syntax match ttCurrent /\[ altr\]/
	elseif a:current_key =~ '�'
		let curr_key = 'a'
		syntax match ttCurrent /\[shiftr\]/
		syntax match ttCurrent /\[ altr\]/
	elseif a:current_key =~ '�'
		let curr_key = 'c'
		syntax match ttCurrent /\[ altr\]/
	elseif a:current_key =~ '�'
		let curr_key = 'c'
		syntax match ttCurrent /\[shiftr\]/
		syntax match ttCurrent /\[ altr\]/
	elseif a:current_key =~ '�'
		let curr_key = 'e'
		syntax match ttCurrent /\[ altr\]/
	elseif a:current_key =~ '�'
		let curr_key = 'e'
		syntax match ttCurrent /\[shiftr\]/
		syntax match ttCurrent /\[ altr\]/
	elseif a:current_key =~ '�'
		let curr_key = 'l'
		syntax match ttCurrent /\[ altr\]/
	elseif a:current_key =~ '�'
		let curr_key = 'l'
		syntax match ttCurrent /\[shiftl\]/
		syntax match ttCurrent /\[ altr\]/
	elseif a:current_key =~ '�'
		let curr_key = 'n'
		syntax match ttCurrent /\[ altr\]/
	elseif a:current_key =~ '�'
		let curr_key = 'n'
		syntax match ttCurrent /\[shiftl\]/
		syntax match ttCurrent /\[ altr\]/
	elseif a:current_key =~ '�'
		let curr_key = 'o'
		syntax match ttCurrent /\[ altr\]/
	elseif a:current_key =~ '�'
		let curr_key = 'o'
		syntax match ttCurrent /\[shiftl\]/
		syntax match ttCurrent /\[ altr\]/
	elseif a:current_key =~ '�'
		let curr_key = 's'
		syntax match ttCurrent /\[ altr\]/
	elseif a:current_key =~ '�'
		let curr_key = 's'
		syntax match ttCurrent /\[shiftr\]/
		syntax match ttCurrent /\[ altr\]/
	elseif a:current_key =~ '�'
		let curr_key = 'z'
		syntax match ttCurrent /\[ altr\]/
	elseif a:current_key =~ '�'
		let curr_key = 'z'
		syntax match ttCurrent /\[shiftr\]/
		syntax match ttCurrent /\[ altr\]/
	elseif a:current_key =~ '�'
		let curr_key = 'x'
		syntax match ttCurrent /\[ altr\]/
	elseif a:current_key =~ '�'
		let curr_key = 'x'
		syntax match ttCurrent /\[shiftr\]/
		syntax match ttCurrent /\[ altr\]/
	" }}}
	endif
	return curr_key
	" }}}
endfunction

" Special imaps for Polish letters
" Polish letters {{{
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
imap <silent> � �<c-o>:call CompareKeys()<cr>
imap <silent> � �<c-o>:call CompareKeys()<cr>
imap <silent> � �<c-o>:call CompareKeys()<cr>
imap <silent> � �<c-o>:call CompareKeys()<cr>
imap <silent> � �<c-o>:call CompareKeys()<cr>
imap <silent> � �<c-o>:call CompareKeys()<cr>
imap <silent> � �<c-o>:call CompareKeys()<cr>
" }}}

" Description of finger keys
let g:l_little_keys = "\t`~1!2@qQaAzZ����"
let g:l_ring_keys   = '3#wWsSxX����'
let g:l_middle_keys = '4$eEdDcC����'
let g:l_index_keys  = '5%6^rRtTfFvVgGbB'
let g:r_index_keys  = '7&8*yYuUhHjJnNmM��'
let g:r_middle_keys = '9(iIkK,<'
let g:r_ring_keys   = '0)oOlL.>�ӳ�'
let g:r_little_keys = "pP-_=+\\|[{]};:'\"/?"
let g:thumb_keys = ' '
