" Plugin part of TTCoach
" (c) Mikolaj Machowski 2002-2004
" Author: Mikolaj Machowski <mikmach@wp.pl>
" Last Change: sun feb 1 12:00  2004 C
" Version: the same as ttcoach.vim
" License: GPL v. 2.0
" Help: In doc/ttcoach.txt

if exists("loaded_ttcoach")
	finish
endif
let loaded_ttcoach = 1
let s:save_cpo = &cpo
set cpo&vim
scriptencoding iso-8859-2

" Keyboard layout. For now valid are: en, de, fr, pl, sk. Obligatory.
if !exists("g:ttcoach_layout") 
	let g:ttcoach_layout = "en"
endif

" root directory for TTCoach files. Most often ~/.vim on *nices and
" something/vimfiles on MS-Windows. Default value for *nices. Obligatory.
if !exists("g:ttcoach_dir") 
	let g:ttcoach_dir = expand("<sfile>:p:h:h")."/macros/ttcoach/"
endif

" If you use gvim. application_mode will resize gvim window to 11 lines, 80
" columns. Thus keyboard will be just under typed text.  Another reason to run
" TTCoach as separate session. Use with care. It is turned off by default.
if !exists("g:ttcoach_application_mode") 
	let g:ttcoach_application_mode = 0
endif

" Length of penalty after fault. Default 500 miliseconds. If you want another
" value read before changing about ":sleep" .
if !exists("g:ttcoach_penalty") 
	let g:ttcoach_penalty = '1m'
endif

" Target for speed in chars per minute. 200 is good for start. But remember
" accuracy is more important. In English word is counted as 5 chars. Thus 200
" is 40 wpm.
if !exists("g:ttc_target_speed") 
	let g:ttc_target_speed = 200
endif

" Target for accuracy. This value should be chaned only up.
" 100 is perfection :) 
if !exists("g:ttc_target_accuracy") 
	let g:ttc_target_accuracy = 98
endif

" This line very generous, can cause problems in future.
exe 'au BufRead,BufEnter *.ttc :source '.g:ttcoach_dir.'ttcoach.vim | '.
	\ " if bufwinnr('short_help') != -1 | :bwipeout short_help | endif"

" =============================================================================
" Commands
" =============================================================================
" TTExplore: open explorer in custom TTCoach directory {{{
if !exists(':TTExplore')
	if v:version >= 602
		let customcompl = '-complete=custom,TTComplete'
	else
		let customcompl = ''
	endif
	exe 'command -nargs=? '.customcompl.' TTExplore '.
		\ ':call Texplore(<f-args>) | silent only'
endif

" }}}
" TTCoach: open explorer in custom TTCoach directory and show short_help {{{
if !exists(':TTCoach')
	if v:version >= 602
		let customcompl = '-complete=custom,TTComplete'
	else
		let customcompl = ''
	endif
	exe 'command -nargs=? '.customcompl.' TTCoach '.
		\ ':silent new | :silent only | :call Texplore(<f-args>) | '.
		\ 'silent 12split '.g:ttcoach_dir.'short_help.vim | '.
		\ 'normal! gg | :silent wincmd j<CR> '
endif

" }}}
" TTCustom: open any file preformatted for practice (÷, double space) {{{ 
if !exists(':TTCustom')
	command -nargs=1 -complete=file TTCustom :call Tcustom(<f-args>) | silent only
endif

" }}}
" =============================================================================
" Functions
" =============================================================================
" Texplore: Open Explorer in custom TTCoach directory {{{
function! Texplore(...)
	if a:0 != 0
		exe 'let g:ttcoach_exe_dir = "'.a:1.'"'
		if a:1 !~ 'vim\|custom\|finger'
			let g:ttcoach_layout = a:1
		endif
	else
		let g:ttcoach_exe_dir = g:ttcoach_layout
	endif
	" Hide .dat files in Explorer
	if !exists("g:explHideFiles")
		let g:explHideFiles = "*.dat"
	elseif exists("g:explHideFiles") && g:explHideFiles !~ "dat"
		let g:explHideFiles = g:explHideFiles . " *.dat"
	endif
	exe 'Explore '.g:ttcoach_dir.g:ttcoach_exe_dir

	exe 'map <F1> normal! :above split '.g:ttcoach_dir.'short_help.vim'."\<cr>12\<C-W>_gg"
	set statusline=%t%=F9-Quit
	map <F9> :qa!<CR>
endfunction

" }}}
" Tcustom: opens any file in TTCoach formatted for practice {{{
function! Tcustom(file)
	exe 'edit '.a:file
	let tmpname = tempname()
	exe 'sav '.tmpname
	let g:ttcoach_exe_dir = "custom"
	let g:ttc_is_custom = 1
	let g:ttc_custom_file = a:file
	exe ':source '.g:ttcoach_dir.'ttcoach.vim'
	:g/^\s*$/d
	:%s/$/÷\r/
	:%s/^\s*//g
	:%s/\s*$//g
	exe 'normal! ggO" custom file: '.a:file.' "'
endfunction

" }}}
" TTComplete: Custom completion of TTCoach command for Vim >= 6.2 {{{
function! TTComplete(A,P,L)
   return "en\nde\nfr\npl\nsk\nvim\nfinger\ncustom"
endfunction

" }}}
" =============================================================================
" Menu
" =============================================================================
if has("gui_running") 
	noremenu Plugin.TTCoach :TTCoach<cr>
endif

let &cpo = s:save_cpo
" vim:fdm=marker:ff=unix
