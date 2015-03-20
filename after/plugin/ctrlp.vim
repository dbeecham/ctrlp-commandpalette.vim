if !exists('g:loaded_ctrlp') || !g:loaded_ctrlp
  finish
endif

let s:save_cpo = &cpo
set cpo&vim

command! CtrlPCommandPalette call ctrlp#init(ctrlp#commandpalette#id())

let &cpo = s:save_cpo
unlet s:save_cpo
