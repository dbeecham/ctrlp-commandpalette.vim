" =============================================================================
" File:          autoload/ctrlp/commandpalette_syntax.vim
" Description:   Commandpalette: Select syntax
" =============================================================================


" Load guard
if ( exists('g:loaded_ctrlp_sample') && g:loaded_ctrlp_sample )
	\ || v:version < 700 || &cp
	finish
endif
let g:loaded_ctrlp_sample = 1

let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#commandpalette_foldmethod#init()',
	\ 'accept': 'ctrlp#commandpalette_foldmethod#accept',
	\ 'lname': 'Set foldmethod to',
	\ 'sname': 'set foldmethod to',
	\ 'type': 'tabs',
	\ })


let s:foldMethods = {
  \ 'Manual		(Create folds manually)':
  \   'manual',
  \ 'Indentation	(Indentation levels decide folding)':
  \   'indent',
  \ 'Custom		(Use foldexpressions)':
  \   'foldexpr',
  \ 'Marker		(Starts with {{{ and ends with }}})':
  \   'marker',
  \ 'Syntax		(Syntax highlighting decide folding)':
  \   'syntax',
  \ 'diff			(Fold text that has not changed)':
  \   'diff'
  \ }

" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#commandpalette_foldmethod#init()
	return keys(s:foldMethods)
endfunction


" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#commandpalette_foldmethod#accept(mode, str)
	" For this example, just exit ctrlp and run help
	call ctrlp#exit()
  redraw
  let l:foldMethod = get(s:foldMethods, a:str, '')
  execute 'set foldmethod=' . l:foldMethod
endfunction

" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#commandpalette_foldmethod#id()
	return s:id
endfunction

" vim:nofen:fdl=0:ts=2:sw=2:sts=2
