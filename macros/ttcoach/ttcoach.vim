" Vim plugin for training touch typing.
" (c) Mikolaj Machowski 2002-2004
" Author: Mikolaj Machowski (mikmach AT wp DOT pl)
" Version: 1.0
" License: GPL v. 2.0
" Last change: sun feb 1 12:00  2004 C
"  
" Help: 
" More in separate doc file: |ttcoach.txt|
" Installation: {{{
"		This program is in development thus there are many global variables for
"		debugging purposes. 
"		Unpack file ttcoach.zip from level of your .vim or vimfiles directory.
"		It will unpack files:
"			ttcplug.vim    - into plugin directory
"			ttcoach.vim    - into new created macros/ttcoach directory
"			ttcoach.txt    - into doc directory. Read |add-local-help|
"			exercise files - into new created macros/ttcoach directory
"		}}}	
" Changelog: {{{
"   From version 0.9.1
"    - highlight bugs, not ":sleep"
"    - goals system
"    - two new exercise files with Vim exercises: colon and sqbrackets
"    - fixed bug with multiple keyboards attached 
"    - many small bugfixes 
"    - Show only ttc files in Explorer commands
"    - Save statistics always with generation - it will free one F-key
"    - Add ! to all :normal commands
"    - TTCustom works on copies, not original files. Shi^W:wq happens
"    - improvements in editing custom files
"    - Menus
"    - Give possibility to save Custom files in separate dir
" }}}
" TODO: {{{
"    - Sessions - keep track on courses (wait for arrays)
"    - Create empty buffer to keep exercise window always small 
"    - Make goals working only after some number of keys
" }}}

scriptencoding iso-8859-2
" 
" Initialization of variables: {{{
" Not always necessary but it makes things look clearer ;)
function! ClearVariables() 
	let s:keys         = 0
	let s:spacenu      = 0
	let s:fault_number = 0
	let s:timestart    = 0
	let s:timeend      = 0
	let g:fault_string = ''
endfunction
call ClearVariables()
" }}}
" System settings: {{{
imapclear
iabclear
if g:ttcoach_penalty == 0
	let g:ttcoach_penalty = '1m'
endif
set hidden
set noequalalways
set virtualedit=
set filetype=
set tw=0
set laststatus=2

" Indentation ...
set indentkeys=
set cinkeys=
set nolisp
set noautoindent
set nocindent
set cinwords=
set lispwords=
set formatoptions-=a
" Setting application mode
if has('gui_running') && g:ttcoach_application_mode != 0
	set nonumber
	set scrolloff=1
	set guioptions-=T
	set guioptions-=m
	set columns=80
	set lines=15
endif
" }}}
" Program maps: {{{
map <silent> <F1> :call ShortHelp()<CR>
map <silent> <F2> :call NewTest()<CR>
map <silent> <F3> :call PrepareTest()<CR>
map <silent> <F4> :call HiLetter()<CR>
map <silent> <F5> :call Statistics()<CR>
map <silent> <F6> :TTExplore<CR>
" map <silent> <F7> :silent! call FlStatistics()<CR>
map <silent> <F8> :call ViewStatistics()<CR>
map <silent> <F9> :qa!<CR>
noremap <buffer> <silent> a :call HiLetter()<CR>:call TimeStart()<CR>a
noremap <buffer> <silent> i :call HiLetter()<CR>:call TimeStart()<CR>i
noremap <buffer> <silent> I :call HiLetter()<CR>:call TimeStart()<CR>I
inoremap <buffer> <silent> <esc> <esc>:call TimeEnd()<CR>
inoremap <buffer> <silent> <c-[> <esc>:call TimeEnd()<CR>

" Disable some Vim maps:
nmap o <Nop>
nmap O <Nop>
nmap d <Nop>
" }}}
" Make sure no keyboard exists and TTCoach know about that {{{
if line('$') !~ '[\s*space\s*]'
   unlet! g:is_keyboard
endif   
" }}}
" Set statusline {{{
set statusline =
			\L:\ %{g:ttcoach_layout}
			\\ \|\ 
			\E:\ %t
			\\ \|\ 
			\A:\ %{Accuracy()}
			\%<%=%(F1-Help\ F2-Start\ F3-Keyboard\ F5-Stats\ F6-New\ F9-Quit%)

function! Accuracy()
	if s:fault_number == 0
		let s:accuracy = 100
	else
		let gpercent = (s:keys-s:fault_number)*10000/s:keys
		let s:accuracy = substitute(gpercent, '\(.*\)\(..\)$', '\1.\2', '')
	endif
	return s:accuracy.'%'
endfunction

" }}}
" Let's do imaps in keyboard rows: {{{
" First row  {{{
imap <buffer> <silent> ~ ~<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> ` `<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> ! !<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> 1 1<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> @ @<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> 2 2<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> # #<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> 3 3<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> $ $<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> 4 4<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> % %<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> 5 5<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> ^ ^<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> 6 6<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> & &<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> 7 7<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> * *<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> 8 8<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> ( (<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> 9 9<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> ) )<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> 0 0<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> _ _<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> - -<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> + +<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> = =<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> <Bar> <Bar><c-o>:call CompareKeys()<cr>
imap <buffer> <silent> \ \<c-o>:call CompareKeys()<cr>
" }}}
" Second Row {{{
imap <buffer> <silent> <Tab> <Tab><c-o>:call CompareKeys()<cr>

imap <buffer> <silent> Q Q<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> q q<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> W W<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> w w<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> E E<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> e e<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> R R<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> r r<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> T T<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> t t<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> Y Y<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> y y<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> U U<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> u u<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> I I<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> i i<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> O O<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> o o<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> P P<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> p p<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> { {<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> [ [<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> } }<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> ] ]<c-o>:call CompareKeys()<cr>
" }}}
" Third Row  {{{
imap <buffer> <silent> A A<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> a a<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> S S<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> s s<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> D D<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> d d<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> F F<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> f f<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> G G<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> g g<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> H H<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> h h<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> J J<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> j j<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> K K<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> k k<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> L L<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> l l<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> : :<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> ; ;<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> " "<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> ' '<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> <cr> <c-o>:call ReturnKey()<cr>
" }}}
" Fourth Row {{{
imap <buffer> <silent> Z Z<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> z z<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> X X<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> x x<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> C C<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> c c<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> V V<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> v v<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> B B<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> b b<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> N N<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> n n<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> M M<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> m m<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> < <<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> , ,<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> > ><c-o>:call CompareKeys()<cr>
imap <buffer> <silent> . .<c-o>:call CompareKeys()<cr>

imap <buffer> <silent> ? ?<c-o>:call CompareKeys()<cr>
imap <buffer> <silent> / /<c-o>:call CompareKeys()<cr>
" }}}

imap <buffer> <silent> <Space> <Space><c-o>:call CompareKeys()<cr>
" }}}

" Source files with definitions of different layouts
exe 'source '.g:ttcoach_dir.'ttc_plug_'.g:ttcoach_layout.'.vim'

" Had to be in if to evade redefining when resourcing
if !exists("*NextExercise")
" ShortHelp: Show and close help screen {{{
function! ShortHelp()
	if bufwinnr('short_help') != -1
		bwipeout short_help.vim
	else
		exe 'normal! :above split '.g:ttcoach_dir.'short_help.vim'."\<CR>12\<C-W>_gg"
	endif
	return 0
endfunction " }}}
" PrepareTest: Show and hide keyboard {{{
function! PrepareTest()
	if winnr() == 2
	   only
    elseif expand("%") =~ 'short_help'
		silent exe "normal! \<C-W>j"
	endif
	if winbufnr(2) == -1
		if !exists("g:is_keyboard") || g:is_keyboard != 1
			exe "normal! G50o\<Esc>G"
			exe 'read '.g:ttcoach_dir.'ttcoach_layout_'.g:ttcoach_layout
			let g:is_keyboard = 1
		endif
		
		let synline = line('$') - 10
		call HiKeyboard(synline)
		split
		exe "normal! \<C-W>j5\<C-W>_G\<C-W>k"
	else
		only
	endif
	if winbufnr(2) != -1 && winheight(2) != 5
		exe "normal! \<C-W>j5\<C-W>_\<C-W>k"
	endif
	silent exe "normal! :2,$v/[]÷]$/s/.*//\<CR>"
	normal! 3G
	call ClearVariables()
	let first_key = getline(2)[0]
	call ColKey(first_key)
endfunction " }}}
" HiKeyboard: Turns on syntax for keyboard {{{
function! HiKeyboard(synline)
		exe 'syntax match ttKeys    /\%>'.a:synline.'l\[.\{-}\]/'
		exe 'syntax match ttKeys    /\%>'.a:synline.'l\[\]\]/'
		exe 'syntax match ttBorder  /\%>'.a:synline.'l|/'
endfunction " }}}
" NewTest: Cleans typed letters and place cursor in start position {{{ 
function! NewTest()
	
	if winnr() == 2
	   only
    elseif expand("%") =~ 'short_help'
		quit
    endif	   
	if exists("g:is_keyboard")
		silent exe "normal! :2,$-5v/[]÷]$/s/.*//\<cr>"
	else
		silent exe "normal! :2,$v/[]÷]$/s/.*//\<cr>"
	endif
	normal! 3G
	call ClearVariables()
	let first_key = getline(2)[0]
	call ColKey(first_key)
endfunction " }}}
" HiLetter: Highlights letter above cursor {{{
function! HiLetter()
	let mastercopy = getline(line('.') - 1)
	let currcol = col('.')
	let up_key = mastercopy[currcol - 1]
	call ColKey(up_key)
endfunction " }}}
" ColKey: Highlights key on keyboard scheme {{{
function! ColKey(current_key)
	syntax clear ttCurrent
	" PVx patch: clear highlight for dead keys and 'double' keys
	syntax clear ttDead
	syntax clear ttDouble

	let g:tck = a:current_key
	let curr_key = ExtLayout(a:current_key)

	if curr_key =~ 'space' || curr_key =~ 'CR'
		let s:spacenu = s:spacenu + 1
	endif

	if exists("curr_key")
		exe "syntax match ttCurrent /\\[".curr_key."\\]/"
	else
		echomsg 'End of exercise. Press <F5> to get statistics.'
	endif
endfunction " }}}
" TimeStart: Saves time of start {{{
function! TimeStart()
	let s:timestart = localtime()
endfunction " }}}
" TimeEnd: Saves time of typing's end {{{
function! TimeEnd()
	let s:timeend = localtime()
endfunction " }}}
" CompareKeys: Compares keys with mastercopy and send values to ColKey function {{{
function! CompareKeys()
	let mastercopy = getline(line('.') - 1)
	let currcol = col('.')
	let s:ul = mastercopy[currcol - 1]
	let s:l = getline('.')[currcol - 1]
	let current_key = mastercopy[currcol]
	if &encoding =~ 'utf-8'
		if col('.') + 2 < strlen(mastercopy)
			call ColKey(current_key)
		elseif col('.') + 2 == strlen(mastercopy)
			call ColKey("÷")
		else
			exe 'sleep '.g:ttcoach_penalty
		endif
	else
		if col('.') + 1 < strlen(mastercopy)
			call ColKey(current_key)
		elseif col('.') + 1 == strlen(mastercopy)
			call ColKey("÷")
		else
			exe 'sleep '.g:ttcoach_penalty
		endif
	endif

	if s:ul != s:l
		exe 'syntax match Error /\%'.line('.').'l\%'.col('.').'c./'
		let s:fault_number = s:fault_number + 1
		let g:fault_string = g:fault_string . s:ul
	else
		if synIDattr(synID(line('.'),col('.'),0),"name") =~ 'Error'
			exe 'syntax match Normal /\%'.line('.').'l\%'.col('.').'c./'
		endif
	endif
	let s:keys = s:keys + 1
endfunction " }}}
" ReturnKey: Reaction for <cr>. {{{
function! ReturnKey()
	if &encoding !~ 'utf-8'
		if getline(line('.')-1)[col('.')] == '÷' 
			normal! 2j|
			let mastercopy = getline(line('.') - 1)
			let currcol = col('.')
			let ret_key = mastercopy[currcol - 1]
			call ColKey(ret_key)
		else
			exe 'sleep '.g:ttcoach_penalty
		endif
	else
		if strlen(getline(line('.')-1)) == strlen(getline(line('.'))) + 2
			normal! 2j|
			let mastercopy = getline(line('.') - 1)
			let currcol = col('.')
			let ret_key = mastercopy[currcol - 1]
			call ColKey(ret_key)
		else
			exe 'sleep '.g:ttcoach_penalty
		endif
	endif
endfunction " }}}
" ViewStatistics: Show statistics {{{
function! ViewStatistics()
	if !exists('s:register')
		echomsg 'You did not create statistics for this session. Press <F5>'
	else
		let s:stats_file = g:ttcoach_dir.g:ttcoach_exe_dir.'/stats.dat'
		exe 'edit '.s:stats_file
		silent only
		setlocal ts=8
		normal! G
	endif
endfunction " }}}
" StatsPercent: Turns numbers into percents {{{
function! StatsPercent(percent)
	let percent = (a:percent*100)/s:fault_number
	"let percent = substitute(percent, '\(.*\)\(..\)$', '\1.\2', '')
	return percent
endfunction " }}}
	" NextExercise: Move to the next exercise if results are good. {{{
	function! NextExercise()
		let curr_exercise = expand("%:t") 
		let nu_exercise = matchstr(curr_exercise, '^..\ze')
		let nu_exercise = substitute(nu_exercise, '^0', '', 'e')
		let next_nu = nu_exercise + 1
		if next_nu < 10
			let next_nu = '0'.next_nu
		endif
		let next_exercise = globpath(g:ttcoach_dir.g:ttcoach_exe_dir, next_nu.'*')
		if filereadable(next_exercise)
			exe 'edit '.next_exercise
		else
			echo 'This is last exercise. Move your goals.'
		endif
	endfunction " }}}
	" Statistics: Creates statistics {{{
	function! Statistics()
		if s:fault_number == 0
			let s:accuracy = 100
			let s:gpercent = 10000
			let s:register = ''
		else
			let s:gpercent = (s:keys-s:fault_number)*10000/s:keys
			let s:accuracy = substitute(s:gpercent, '\(.*\)\(..\)$', '\1.\2', '')
		endif
		let s:time = s:timeend - s:timestart
		if s:time == 0
			let s:speed = 0
		else
			let s:speed = s:keys*60/s:time
		endif
		" Create statistics string
		let s:statstring = "Number of keystrokes:\t".s:keys."\n".
					\ "Number of faults:\t".s:fault_number."\n".
					\ "Accuracy:\t\t".s:accuracy."%\n".
					\ "Time:\t\t\t".s:time."s\n".
					\ "Characters per minute:\t".s:speed."\n".
					\ "Words per minute:\t".s:spacenu."\n"
		if s:accuracy != 100
			let s:statstring = s:statstring.'---- Faults per letter -----'."\n"
			let fstring = g:fault_string
			let s:register = ''
			let i = 0
			while i < s:fault_number
				if s:register !~ fstring[i]
					let s:register = s:register . fstring[i]
				endif
				let i = i + 1
			endwhile
			let s:reglen = strlen(s:register)
			let regnum = 0
			while regnum < s:reglen
				let s:fault{regnum} = 0
				let faultnum = 0
				while faultnum < s:fault_number
					if s:register[regnum] == fstring[faultnum]
						let s:fault{regnum} = s:fault{regnum} + 1
					endif
					let faultnum = faultnum + 1
				endwhile
				let regnum = regnum + 1
			endwhile
			let regnum = 0
			while regnum < s:reglen
				let s:statstring = s:statstring.'    '.s:register[regnum].":\t\t".
							\ s:fault{regnum}."\t".StatsPercent(s:fault{regnum})."%\n"
				let regnum = regnum + 1
			endwhile
			if g:ttcoach_layout !~ 'vim\|custom\|finger'
				let s:statstring = s:statstring.'---- Faults per finger -----'."\n"
				let s:l_little_faults = 0
				let s:l_ring_faults   = 0
				let s:l_middle_faults = 0
				let s:l_index_faults  = 0
				let s:r_index_faults  = 0
				let s:r_middle_faults = 0
				let s:r_ring_faults   = 0
				let s:r_little_faults = 0
				let s:thumb_faults = 0
				let regnum = 0
				while regnum < s:reglen
					if g:l_little_keys =~ s:register[regnum]
						let s:l_little_faults = s:l_little_faults + s:fault{regnum}
					elseif g:l_ring_keys =~ s:register[regnum]
						let s:l_ring_faults = s:l_ring_faults + s:fault{regnum}
					elseif g:l_middle_keys =~ s:register[regnum]
						let s:l_middle_faults = s:l_middle_faults + s:fault{regnum}
					elseif g:l_index_keys =~ s:register[regnum]
						let s:l_index_faults = s:l_index_faults + s:fault{regnum}
					elseif g:r_index_keys =~ s:register[regnum]
						let s:r_index_faults = s:r_index_faults + s:fault{regnum}
					elseif g:r_middle_keys =~ s:register[regnum]
						let s:r_middle_faults = s:r_middle_faults + s:fault{regnum}
					elseif g:r_ring_keys =~ s:register[regnum]
						let s:r_ring_faults = s:r_ring_faults + s:fault{regnum}
					elseif g:r_little_keys =~ s:register[regnum]
						let s:r_little_faults = s:r_little_faults + s:fault{regnum}
					elseif g:thumb_keys =~ s:register[regnum]
						let s:thumb_faults = s:thumb_faults + s:fault{regnum}
					endif
					let regnum = regnum + 1
				endwhile
				let s:statstring = s:statstring .
					\"L. pinky:\t".s:l_little_faults."\t".StatsPercent(s:l_little_faults)."%\n".
					\"Left ring:\t".s:l_ring_faults."\t".StatsPercent(s:l_ring_faults)."%\n".
					\"Left middle:\t".s:l_middle_faults."\t".StatsPercent(s:l_middle_faults)."%\n".
					\"Left index:\t".s:l_index_faults."\t".StatsPercent(s:l_index_faults)."%\n".
					\"Thumbs:\t\t".s:thumb_faults."\t".StatsPercent(s:thumb_faults)."%\n".
					\"Right index:\t".s:r_index_faults."\t".StatsPercent(s:r_index_faults)."%\n".
					\"Right middle:\t".s:r_middle_faults."\t".StatsPercent(s:r_middle_faults)."%\n".
					\"Right ring:\t".s:r_ring_faults."\t".StatsPercent(s:r_ring_faults)."%\n".
					\"R. pinky:\t".s:r_little_faults."\t".StatsPercent(s:r_little_faults)."%\n"
			endif
		endif
		echo s:statstring
		" It works properly only with \d\d.... files. Make proper if.
		call FlStatistics() 
		if !exists("g:ttc_is_custom")
			call Goals()
		else
			unlet g:ttc_is_custom
		endif
		return
	endfunction " }}}
" FlStatistics:  Writes statistics to stats.dat in appropriate directory {{{
function! FlStatistics()
	if !exists('s:register')
		echomsg 'You did not create statistics for this session. Press <F5>'
	else
		let s:stats_file = g:ttcoach_dir.g:ttcoach_exe_dir.'/stats.dat'
		let testdata = 'Date: '.strftime('%c')."\n".
					\  'Lesson: '.expand('%:t')."\n"
		let flush = testdata.s:statstring.
					\  '======================================'
		exe ':silent 1split '.s:stats_file
		normal! G
		put =flush
		silent write
		:silent quit
		let synkeybordline = line('$') - 5
		call HiKeyboard(synkeybordline)
	endif
	return
endfunction " }}}
	" Goals: Compare generated statistics with goals {{{
	function! Goals()
		let target_accuracy = substitute(s:gpercent, '..$', '', '')
		if target_accuracy < g:ttc_target_accuracy && s:speed < g:ttc_target_speed
			let text = 'Slow and bad accuracy. You have to practice on this file.'
			let choice = '[P]ractice (Q)uit'
			let default = 'p'
		elseif target_accuracy < g:ttc_target_accuracy && s:speed >= g:ttc_target_speed
			let text = 'Too fast, concentrate on accuracy. You have to practice on this file.'
			let choice = '[P]ractice (Q)uit'
			let default = 'p'
		elseif target_accuracy >= g:ttc_target_accuracy && s:speed < g:ttc_target_speed
			let text = 'Good accuracy but slowly, practice more.'
			let choice = '[P]ractice (N)extExercise (Q)uit'
			let default = 'p'
		elseif target_accuracy >= g:ttc_target_accuracy && s:speed >= g:ttc_target_speed
			let text = 'Excellent! You can move to the next exercise or move your goals.'
			let choice = '(P)ractice [N]extExercise (Q)uit (G)oals'
			let default = 'n'
		endif
		let nextstep = input(text."\n".choice.': ')
		if nextstep =~? '^p'
			call NewTest()
		elseif nextstep =~? '^n'
			call NextExercise()
		elseif nextstep =~? '^q'
			:qa!
		elseif nextstep =~? '^n'
			call NextExercise()
		elseif nextstep =~? '^g'
			call MoveGoals()
		elseif nextstep == ''
			if default =~ 'p'
				call NewTest()
			elseif default =~ 'q'
				:qa!
			elseif default =~ 'n'
				call NextExercise()
			endif
		endif
		return
	endfunction " }}}
	" MoveGoals: Change goals for current session {{{
	function! MoveGoals()
		echo "Current goals:   ".
		  \ "Accuracy: ".g:ttc_target_accuracy."     Speed: ".g:ttc_target_speed
		let new_accuracy    = input('New accuracy (full percents, <= 100): ')
		if new_accuracy != ''
			if new_accuracy =~ '[^0-9]' || new_accuracy > 100
				echo "\nNew value had to be: full number, less than 100"
				call MoveGoals()
			else
				let g:ttc_target_accuracy = new_accuracy
			endif
		endif
		let new_speed       = input('   New speed (chars per minute): ')
		if new_speed != ''
			if new_speed =~ '[^0-9]'
				echo "\nNew value can have only digits, please repeat from beginning!"
				call MoveGoals()
			else
				let g:ttc_target_speed = new_speed
			endif
		endif

		call NewTest()

	endfunction " }}}
endif

" ===========================================================================
" Menus
" ===========================================================================
" Turn on only if in gui {{{
if has("gui_running")
	noremenu <silent> TTCoach.Start<Tab>F2             :call NewTest()<CR>
	noremenu <silent> TTCoach.Highlight\ letter<Tab>F4 :call HiLetter()<CR>
	noremenu <silent> TTCoach.New<Tab>F6               :TTExplore<CR>
	noremenu <silent> TTCoach.Keyboard<Tab>F3          :call PrepareTest()<CR>
	noremenu <silent> TTCoach.Statistics<Tab>F5        :call Statistics()<CR>
	noremenu <silent> TTCoach.Show\ statistics<Tab>F8  :call ViewStatistics()<CR>

	" Change layouts, exercises: en, de, fr, pl, sk, vim, finger, custom
	noremenu <silent> TTCoach.Exercise.en     :TTCoach en<CR>
	noremenu <silent> TTCoach.Exercise.de     :TTCoach de<CR>
	noremenu <silent> TTCoach.Exercise.fr     :TTCoach fr<CR>
	noremenu <silent> TTCoach.Exercise.pl     :TTCoach pl<CR>
	noremenu <silent> TTCoach.Exercise.sk     :TTCoach sk<CR>
	noremenu <silent> TTCoach.Exercise.vim    :TTCoach vim<CR>
	noremenu <silent> TTCoach.Exercise.finger :TTCoach finger<CR>
	noremenu <silent> TTCoach.Exercise.custom :TTCoach custom<CR>

	noremenu <silent> TTCoach.Help<Tab>F1     :call ShortHelp()<CR>
	noremenu <silent> TTCoach.Quit<Tab>F9     :qa!<CR>

endif	
" }}}
" ===========================================================================
" Custom
" ===========================================================================
" TTCustomSave: Save custom created file in custom subdir of ttcoach {{{ 
command! -nargs=0 TTCustomSave :silent call Tcustomsave()<cr>

function! Tcustomsave()
	silent exe "normal! :2,$v/÷$/s/.*//\<cr>"
	silent exe "normal! :2,$v/^[/s/.*//\<cr>"
	normal! gg
	exe 'sav! '.g:ttcoach_dir.'/custom/'.g:ttc_custom_file.'.ttc'
endfunction
" }}}
 
" Syntax matches: {{{
syntax match ttHeader  /^".*"$/
syntax match ttText    /.*÷$/
" }}}
" Syntax hi defs: {{{
hi def link ttHeader   Comment
hi def link ttText     Type 
hi def link ttKeys     Comment
hi def link ttBorder   Statement
hi def link ttCurrent  Error 
" PVx patch: highlight for dead and double keys
hi def link ttDead     Search 
hi def link ttDouble   Visual 
" }}}
 
" vim:fdm=marker:ts=4:sw=4:noet
