" Plugin part of TTCoach
" (c) Mikolaj Machowski 2002 
" Author: Mikolaj Machowski <mikmach@wp.pl>
" Last Change: wto lis 12 10:00  2002 C
" Version: the same as ttcoach.vim
" License: GPL v. 2.0
" Help: In doc/ttcoach.txt

if exists("loaded_ttcoach")
	finish
endif
let loaded_ttcoach = 1
let s:save_cpo = &cpo
set cpo&vim

" Keyboard layout. For now valid are: en, de, fr, pl. Obligatory.
if !exists("g:ttcoach_layout") 
	let g:ttcoach_layout = "en"
endif

" root directory for TTCoach files. Most often ~/.vim on *nices and
" something/vimfiles on MS-Windows. Default value for *nices. Obligatory.
if !exists("g:ttcoach_dir") 
	let g:ttcoach_dir = expand("<sfile>:p:h:h")."/macros/"
endif

" If you use gvim. application_mode will resize gvim window to 11 lines, 80
" columns. Thus keyboard will be just under typed text.  Another reason to run
" TTCoach as separate session. Use with care. It is commented by default.
if !exists("g:ttcoach_application_mode") 
	let g:ttcoach_application_mode = "0"
endif

" Length of penalty after fault. Default 500 miliseconds. If you want another
" value read before changing :help sleep .
if !exists("g:ttcoach_penalty") 
	let g:ttcoach_penalty = "500m"
endif

" This line if for *nix. users of other systems should modify it.
exe 'au BufRead '.g:ttcoach_dir."ttcoach/*.ttc :source ".g:ttcoach_dir.'ttcoach.vim'

if !exists(":TTExplore")
	command -nargs=? TTExplore :call Texplore(<f-args>) | silent only
endif
function! Texplore(...)
	if a:0 != 0
		exe 'let g:ttcoach_exe_dir = "'.a:1.'"'
		if a:1 !~ "vim\\|custom\\|finger"
			let g:ttcoach_layout = a:1
		endif
	else
		let g:ttcoach_exe_dir = g:ttcoach_layout
	endif
	exe 'Explore '.g:ttcoach_dir.'/ttcoach/'.g:ttcoach_exe_dir
endfunction

let &cpo = s:save_cpo
" vim:fdm=marker
