" Polish letters {{{
if g:ttcoach_layout == "pl" 
	imap <silent> ± ±<c-o>:call CompareKeys()<cr>
	imap <silent> ° °<c-o>:call CompareKeys()<cr>
	imap <silent> Ê Ê<c-o>:call CompareKeys()<cr>
	imap <silent> ∆ ∆<c-o>:call CompareKeys()<cr>
	imap <silent> Í Í<c-o>:call CompareKeys()<cr>
	imap <silent>    <c-o>:call CompareKeys()<cr>
	imap <silent> ≥ ≥<c-o>:call CompareKeys()<cr>
	imap <silent> £ £<c-o>:call CompareKeys()<cr>
	imap <silent> Ò Ò<c-o>:call CompareKeys()<cr>
	imap <silent> — —<c-o>:call CompareKeys()<cr>
	imap <silent> Û Û<c-o>:call CompareKeys()<cr>
	imap <silent> ” ”<c-o>:call CompareKeys()<cr>
	imap <silent> ∂ ∂<c-o>:call CompareKeys()<cr>
	imap <silent> ¶ ¶<c-o>:call CompareKeys()<cr>
	imap <silent> ø ø<c-o>:call CompareKeys()<cr>
	imap <silent> Ø Ø<c-o>:call CompareKeys()<cr>
	imap <silent> º º<c-o>:call CompareKeys()<cr>
	imap <silent> ¨ ¨<c-o>:call CompareKeys()<cr>
endif
" }}}
function! ExtLayout(current_key) 
	" Common part of English and Polish layout {{{
	if g:ttcoach_layout == "en" || g:ttcoach_layout == "pl"
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
		elseif a:current_key =~ '˜'
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
		endif
		" }}}
		" Polish letters in iso-8859-2 {{{
		if g:ttcoach_layout == "pl" 
			if a:current_key =~ '±'
				let curr_key = 'a'
				syntax match ttCurrent /\[ altr\]/
			elseif a:current_key =~ '°'
				let curr_key = 'a'
				syntax match ttCurrent /\[shiftr\]/
				syntax match ttCurrent /\[ altr\]/
			elseif a:current_key =~ 'Ê'
				let curr_key = 'c'
				syntax match ttCurrent /\[ altr\]/
			elseif a:current_key =~ '∆'
				let curr_key = 'c'
				syntax match ttCurrent /\[shiftr\]/
				syntax match ttCurrent /\[ altr\]/
			elseif a:current_key =~ 'Í'
				let curr_key = 'e'
				syntax match ttCurrent /\[ altr\]/
			elseif a:current_key =~ ' '
				let curr_key = 'e'
				syntax match ttCurrent /\[shiftr\]/
				syntax match ttCurrent /\[ altr\]/
			elseif a:current_key =~ '≥'
				let curr_key = 'l'
				syntax match ttCurrent /\[ altr\]/
			elseif a:current_key =~ '£'
				let curr_key = 'l'
				syntax match ttCurrent /\[shiftl\]/
				syntax match ttCurrent /\[ altr\]/
			elseif a:current_key =~ 'Ò'
				let curr_key = 'n'
				syntax match ttCurrent /\[ altr\]/
			elseif a:current_key =~ '—'
				let curr_key = 'n'
				syntax match ttCurrent /\[shiftl\]/
				syntax match ttCurrent /\[ altr\]/
			elseif a:current_key =~ 'Û'
				let curr_key = 'o'
				syntax match ttCurrent /\[ altr\]/
			elseif a:current_key =~ '”'
				let curr_key = 'o'
				syntax match ttCurrent /\[shiftl\]/
				syntax match ttCurrent /\[ altr\]/
			elseif a:current_key =~ '∂'
				let curr_key = 's'
				syntax match ttCurrent /\[ altr\]/
			elseif a:current_key =~ '¶'
				let curr_key = 's'
				syntax match ttCurrent /\[shiftr\]/
				syntax match ttCurrent /\[ altr\]/
			elseif a:current_key =~ 'ø'
				let curr_key = 'z'
				syntax match ttCurrent /\[ altr\]/
			elseif a:current_key =~ 'Ø'
				let curr_key = 'z'
				syntax match ttCurrent /\[shiftr\]/
				syntax match ttCurrent /\[ altr\]/
			elseif a:current_key =~ 'º'
				let curr_key = 'x'
				syntax match ttCurrent /\[ altr\]/
			elseif a:current_key =~ '¨'
				let curr_key = 'x'
				syntax match ttCurrent /\[shiftr\]/
				syntax match ttCurrent /\[ altr\]/
			endif
		endif
		" }}}
	endif " }}}
	return curr_key
endfunction
let s:l_little_keys = "\t`~1!2@qQaAzZ±°øØ"
let s:l_ring_keys   = '3#wWsSxX∂¶º¨'
let s:l_middle_keys = '4$eEdDcCÍ Ê∆'
let s:l_index_keys  = '5%6^rRtTfFvVgGbB'
let s:r_index_keys  = '7&8*yYuUhHjJnNmMÒ—'
let s:r_middle_keys = '9(iIkK,<'
let s:r_ring_keys   = '0)oOlL.>Û”≥£'
let s:r_little_keys = "pP-_=+\\|[{]};:'\"/?"
let thumb_keys = ' '
