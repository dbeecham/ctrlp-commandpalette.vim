" =============================================================================
" File:          autoload/ctrlp/commandpalette.vim
" Description:   A command palette extension for ctrlp.vim.
" =============================================================================

let g:loaded_ctrlp_commandpalette = 1

" The main variable for this extension.
"
" The values are:
" + the name of the input function (including the brackets and any argument)
" + the name of the action function (only the name)
" + the long and short names to use for the statusline
" + the matching type: line, path, tabs, tabe
"                      |     |     |     |
"                      |     |     |     `- match last tab delimited str
"                      |     |     `- match first tab delimited str
"                      |     `- match full line like file/dir path
"                      `- match full line
let s:commandpalette_vars = {
	\ 'init': 'ctrlp#commandpalette#init()',
	\ 'accept': 'ctrlp#commandpalette#accept',
	\ 'lname': 'commandpalette',
	\ 'sname': 'cmdpal',
	\ 'type': 'tabs',
	\ 'sort': 0,
	\ }

" commandpalette uses a dictionary, g:commandPalette, with keys being
" searchable strings, and values are commands to be run (which are also
" strings). g:ctrlp_commandpalette_file if the path to a file which defines
" this dictionary. It's default is commands.vim in the same directory as 
" this file.

function! ctrlp#commandpalette#load()
  if exists("g:ctrlp_commandpalette_autoload_commands") &&
        \ g:ctrlp_commandpalette_autoload_commands =~ "0"
    return
  endif

  execute "source " . s:filePath . "/commandpalette_commands.vim"
endfunction

let s:filePath = expand("<sfile>:h")

call ctrlp#commandpalette#load()


" Append s:commandpalette_vars to g:ctrlp_ext_vars
if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
	let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:commandpalette_vars)
else
	let g:ctrlp_ext_vars = [s:commandpalette_vars]
endif


" This will be called by ctrlp to get the full list of elements
" where to look for matches
function! ctrlp#commandpalette#init()
  return keys(g:commandPalette)
endfunction


" This will be called by ctrlp when a match is selected by the user
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
func! ctrlp#commandpalette#accept(mode, str)
  call ctrlp#exit()
  redraw
  let l:cmd = get(g:commandPalette, a:str, "echo 'Command not found!'")
  execute l:cmd
endfunc


" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
" Allow it to be called later
function! ctrlp#commandpalette#id()
  return s:id
endfunction


" vim:fen:fdl=0:ts=2:sw=2:sts=2
