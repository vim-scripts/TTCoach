" Vim plugin for training touch typing.
" (c) Mikolaj Machowski 2002-2003
" Author: Mikolaj Machowski (mikmach AT wp DOT pl)
" Version: 0.9
" License: GPL v. 2.0
" Last change: czw paz 8 06:00  2003 C
"  
" Help: 
" More in separate doc file: |ttcoach.txt|
" Installation: {{{
"		This program is in development thus there are many global variable for
"		debugging purposes. 
"		Unpack file ttcoach.zip from level of your .vim or vimfiles directory.
"		It will unpack files:
"			ttcplug.vim    - into plugin directory
"			ttcoach.vim    - into new created macros/ttcoach directory
"			ttcoach.txt    - into doc directory. Read |add-local-help|
"			exercise files - into new created macros/ttcoach directory
"		}}}	
" Changelog: {{{
"	From version 0.8
"    - drill: new exercise for Vim Normal mode commands
"    - name of layout, exercise and accuracy in statusline
"    - most important Fx shortcuts in statusline
"    - add words per minute statistics
"    - improved handling of small_help window
"    - automatic highlighting with i,I commands (no need for F4)
"    - remove blank lines in TTCustom files
"    - silencing of preparation commands
" }}}
" TODO: {{{
"   - Translation of messages?
"   - Easier switching between exercises
"   - Targets for learning: accuracy, speed
"   - Menus 
" }}}

" Initialization of variables: {{{
" Not always necessary but it makes things look clearer ;)
function! s:ClearVariables() 
	let s:keys         = 0
	let s:spacenu      = 0
	let s:fault_number = 0
	let s:timestart    = 0
	let s:timeend      = 0
	let g:fault_string = ''
endfunction
call <SID>ClearVariables()
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
if has('gui_running') && g:ttcoach_application_mode != 0
	set nonumber
	set scrolloff=1
	set guioptions-=T
	set guioptions-=m
	set columns=80
	set lines=11
endif
" }}}
" Program maps: {{{
map <silent> <F1> :call <SID>ShortHelp()<cr>
map <silent> <F2> :call <SID>NewTest()<cr>
map <silent> <F3> :call <SID>PrepareTest()<cr>
map <silent> <F4> :call <SID>HiLetter()<cr>
map <silent> <F5> :call <SID>Statistics()<cr>
map <silent> <F6> :TTExplore<cr>
map <silent> <F7> :call <SID>FlushStatistics()<cr>
map <silent> <F8> :call <SID>ViewStatistics()<cr>
map <silent> <F9> :qa!<cr>
noremap <buffer> <silent> i :call <SID>HiLetter()<cr>:call <SID>TimeStart()<cr>i
noremap <buffer> <silent> I :call <SID>HiLetter()<cr>:call <SID>TimeStart()<cr>I
inoremap <buffer> <silent> <esc> <esc>:call <SID>TimeEnd()<cr>
inoremap <buffer> <silent> <c-[> <esc>:call <SID>TimeEnd()<cr>
" }}}

" Set statusline {{{
set statusline =
			\Layout:\ %{g:ttcoach_layout}
			\\ \|\ 
			\Exercise:\ %t
			\\ \|\ 
			\%{Accuracy()}
			\%<%=%(F1-Help\ F3-Keyboard\ F5-Stats\ F9-Quit%)

function! Accuracy()
	if s:fault_number == 0
		let s:accuracy = 100
	else
		let gpercent = (s:keys-s:fault_number)*10000/s:keys
		let s:accuracy = substitute(gpercent, '\(.*\)\(..\)$', '\1.\2', '')
	endif
	return 'Accuracy: '.s:accuracy.'%'
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

imap <buffer> <silent> <cr> <c-o>:call <SID>ReturnKey()<cr>
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

function! s:ShortHelp()   " {{{
" Shows help screen
	exe 'normal :above split '.g:ttcoach_dir.'short_help.vim'."\<cr>11\<C-W>_gg"
endfunction " }}}
function! s:PrepareTest() " {{{
" Add keyboard layout to the file, split window and place cursor in start
" position
	if winnr() == 2
	   only
    elseif expand("%") =~ 'short_help'
		quit
	endif
	if winbufnr(2) == -1
		let underline = 510 - line('$')
		exe "normal G".underline."o\<esc>G"
		exe 'read '.g:ttcoach_dir.'ttcoach_layout_'.g:ttcoach_layout
		split
		exe "normal \<c-w>j5\<c-w>_G\<c-w>k"
	endif
	if winbufnr(2) != -1 && winheight(2) != 5
		exe "normal \<c-w>j5\<c-w>_\<c-w>k"
	endif
	silent exe "normal :2,$v/[]÷]$/s/.*//\<cr>"
	normal 3G
	call <SID>ClearVariables()
	let first_key = getline(2)[0]
	call <SID>ColKey(first_key)
endfunction " }}}
function! s:NewTest()     " {{{
" Cleans typed letters and place cursor in start position
	if winnr() == 2
	   only
    elseif expand("%") =~ 'short_help'
		quit
    endif	   
	silent exe "normal :2,$v/[]÷]$/s/.*//\<cr>"
	normal! 3G
	call <SID>ClearVariables()
	let first_key = getline(2)[0]
	call <SID>ColKey(first_key)
endfunction " }}}
function! s:HiLetter()    " {{{
" Highlights letter above cursor
	let mastercopy = getline(line('.') - 1)
	let currcol = col('.')
	let up_key = mastercopy[currcol - 1]
	call <SID>ColKey(up_key)
endfunction " }}}
function! s:TimeStart()   " {{{
" Saves time of start
	let s:timestart = localtime()
endfunction " }}}
function! s:TimeEnd()     " {{{
" Saves time of typing's end
	let s:timeend = localtime()
endfunction " }}}
function! CompareKeys()   " {{{
" Compares keys with mastercopy and send values to ColKey function
	let mastercopy = getline(line('.') - 1)
	let currcol = col('.')
	let s:ul = mastercopy[currcol - 1]
	let s:l = getline('.')[currcol - 1]
	let current_key = mastercopy[currcol]
	if col('.') + 1 < strlen(mastercopy)
		call <SID>ColKey(current_key)
	elseif col('.') + 1 == strlen(mastercopy)
		call <SID>ColKey("÷")
	else
		exe 'sleep '.g:ttcoach_penalty
	endif
	if s:ul != s:l
		"set hls
		"exe "normal /^.*\%#<cr>"
		exe 'sleep '.g:ttcoach_penalty
		"nohl
		let s:fault_number = s:fault_number + 1
		let g:fault_string = g:fault_string . s:ul
	endif
	let s:keys = s:keys + 1
endfunction " }}}
function! s:ReturnKey()   " {{{
" Reaction for <cr>.
	if getline(line('.')-1)[col('.')] == '÷' 
		normal 2j|
		let mastercopy = getline(line('.') - 1)
		let currcol = col('.')
		let ret_key = mastercopy[currcol - 1]
		call <SID>ColKey(ret_key)
	else
		exe 'sleep '.g:ttcoach_penalty
	endif
endfunction " }}}
function! s:Statistics()  " {{{
" Creates statistics
	if s:fault_number == 0
		let s:accuracy = 100
	else
		let gpercent = (s:keys-s:fault_number)*10000/s:keys
		let s:accuracy = substitute(gpercent, '\(.*\)\(..\)$', '\1.\2', '')
	endif
	let s:time = s:timeend - s:timestart
	if s:time == 0
		let s:speed = 0
	else
		let s:speed = s:keys*60/s:time
	endif
    echo "Number of keystrokes:\t".s:keys."\n"
	echo "Number of faults:\t".s:fault_number."\n"
	echo "Accuracy:\t\t".s:accuracy."%\n"
	echo "Time:\t\t\t".s:time."s\n"
	echo "Characters per minute:\t".s:speed
	echo "Words per minute:\t".s:spacenu
	if s:accuracy != 100
		echo '---- Faults per letter -----'
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
			echo '    '.s:register[regnum].":\t\t".s:fault{regnum}."\t".<SID>StatsPercent(s:fault{regnum})."%"
			let regnum = regnum + 1
		endwhile
		if g:ttcoach_layout !~ "vim\\|custom\\|finger"
			echo '---- Faults per finger -----'
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
			echo "L. pinky:\t".s:l_little_faults."\t".<SID>StatsPercent(s:l_little_faults).'%'
			echo "Left ring:\t".s:l_ring_faults."\t".<SID>StatsPercent(s:l_ring_faults).'%'
			echo "Left middle:\t".s:l_middle_faults."\t".<SID>StatsPercent(s:l_middle_faults).'%'
			echo "Left index:\t".s:l_index_faults."\t".<SID>StatsPercent(s:l_index_faults).'%'
			echo "Thumbs:\t\t".s:thumb_faults."\t".<SID>StatsPercent(s:thumb_faults).'%'
			echo "Right index:\t".s:r_index_faults."\t".<SID>StatsPercent(s:r_index_faults).'%'
			echo "Right middle:\t".s:r_middle_faults."\t".<SID>StatsPercent(s:r_middle_faults).'%'
			echo "Right ring:\t".s:r_ring_faults."\t".<SID>StatsPercent(s:r_ring_faults).'%'
			echo "R. pinky:\t".s:r_little_faults."\t".<SID>StatsPercent(s:r_little_faults).'%'
		endif
	endif
endfunction " }}}
function! s:ViewStatistics() " {{{
" Obvious
if !exists('s:register')
	echomsg 'You did not create statistics for this session. Press <F5>'
else
	exe 'view '.s:stats_file
	silent only
	normal G
endif
endfunction " }}}
function! s:FlushStatistics() " {{{
" Writes statistics to stats.dat
if !exists('s:register')
	echomsg 'You did not create statistics for this session. Press <F5>'
else
	let s:stats_file = g:ttcoach_dir.'/'.g:ttcoach_exe_dir.'/stats.dat'
	let g:stats_file = s:stats_file
	exe 'silent !echo "Date: '.strftime("%c").'" >> '.s:stats_file
	exe 'silent !echo "Lesson: '.expand("%:t").'" >> '.s:stats_file
	exe 'silent !echo "Number of keystrokes: '.s:keys.'" >> '.s:stats_file
	exe 'silent !echo "Number of faults: '.s:fault_number.'" >> '.s:stats_file
	exe 'silent !echo "Accuracy: '.s:accuracy.'\%" >> '.s:stats_file
	exe 'silent !echo "Time: '.s:time.' s" >> '.s:stats_file
	exe 'silent !echo "Characters per minute: '.s:speed.'" >> '.s:stats_file
	exe 'silent !echo "Words per minute: '.s:spacenu.'" >> '.s:stats_file
	if s:accuracy != 100
		exe 'silent !echo "---- Faults per letter -----" >> '.s:stats_file
		let regnum = 0
		while regnum < s:reglen
			exe "silent !echo '  '".s:register[regnum]."':  '".s:fault{regnum}."'    '".<SID>StatsPercent(s:fault{regnum})."'\\%' >> ".s:stats_file
			let regnum = regnum + 1
		endwhile
		if g:ttcoach_layout !~ "vim\\|custom\\|finger"
			exe 'silent !echo "---- Faults per finger -----" >> '.s:stats_file
			exe 'silent !echo "L. pinky: '.s:l_little_faults.'  '.<SID>StatsPercent(s:l_little_faults).'\%" >> '.s:stats_file
			exe 'silent !echo "Left ring: '.s:l_ring_faults.'  '.<SID>StatsPercent(s:l_ring_faults).'\%" >> '.s:stats_file
			exe 'silent !echo "Left middle: '.s:l_middle_faults.'  '.<SID>StatsPercent(s:l_middle_faults).'\%" >> '.s:stats_file
			exe 'silent !echo "Left index: '.s:l_index_faults.'  '.<SID>StatsPercent(s:l_index_faults)/.'\%" >> '.s:stats_file
			exe 'silent !echo "Thumbs:  '.s:thumb_faults.'  '.<SID>StatsPercent(s:thumb_faults).'\%" >> '.s:stats_file
			exe 'silent !echo "Right index: '.s:r_index_faults.'  '.<SID>StatsPercent(s:r_index_faults).'\%" >> '.s:stats_file
			exe 'silent !echo "Right middle: '.s:r_middle_faults.'  '.<SID>StatsPercent(s:r_middle_faults).'\%" >> '.s:stats_file
			exe 'silent !echo "Right ring: '.s:r_ring_faults.'  '.<SID>StatsPercent(s:r_ring_faults).'\%" >> '.s:stats_file
			exe 'silent !echo "R. pinky: '.s:r_little_faults.'  '.<SID>StatsPercent(s:r_little_faults).'\%" >> '.s:stats_file
		endif
	endif
    exe '!echo "======================================" >> '.s:stats_file
endif
endfunction " }}}
function! s:StatsPercent(percent) " {{{
" Turns numbers into percents
	let percent = (a:percent*100)/s:fault_number
	"let percent = substitute(percent, '\(.*\)\(..\)$', '\1.\2', '')
	return percent
endfunction " }}}
function! s:ColKey(current_key) " {{{
" Highlights key on keyboard scheme
	syntax clear ttCurrent
	" PVx patch: clear highlight for dead keys and 'double' keys
	syntax clear ttDead
	syntax clear ttDouble

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

" Syntax matches: {{{
syntax match ttHeader  /^".*"$/
syntax match ttText    /.*÷$/
syntax match ttKeys    /\%>100l\[.\{-}\]/
syntax match ttKeys    /\%>100l\[\]\]/
syntax match ttBorder  /\%>100l|/
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
