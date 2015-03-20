function! ctrlp#command_palette_commands#ToggleNumber()
    set number!
    set relativenumber!
endfunction

function! ctrlp#command_palette_commands#ToggleSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        syntax on
    endif
endfunction

function! ctrlp#command_palette_commands#SetSyntax()
    let l:newsyntax = input('Set syntax to: ', &syntax, 'syntax')
    execute "set syntax=" . l:newsyntax
endfunction

function! ctrlp#command_palette_commands#OpenFile()
    let l:newfile = input('Open: ', '', 'file')
    execute "open " . l:newfile
endfunction

let s:commandPalette = {
    \ 'Unprintable characters: Toggle display': 
    \   'set list!',
    \ 'Line numbers: Toggle relative':
    \   'set relativenumber!',
    \ 'Line numbers: Toggle': 
    \   'call ctrlp#command_palette_commands#ToggleNumber()',
    \ 'Build (make)':
    \   'make',
    \ 'Window: Split horizontally':
    \   'split',
    \ 'Window: Split vertically':
    \   'vsplit',
    \ 'Paste mode: Toggle':
    \   'set paste!',
    \ 'Syntax highlighting: Set':
    \   'call ctrlp#command_palette_commands#SetSyntax()',
    \ 'Syntax highlighting: Toggle':
    \   'ctrlp#command_palette_commands#ToggleSyntax()',
    \ 'File: Open':
    \   'call ctrlp#command_palette_commands#OpenFile()',
    \ 'Buffers: New empty':
    \   'enew',
    \ 'Buffers: Select':
    \   'CtrlPBuffer',
    \ 'Buffers: Close':
    \   'bdelete',
    \ 'Buffers: List':
    \   'buffers'
    \ }

if exists("g:commandPalette")
    call extend(g:commandPalette, s:commandPalette, "keep")
else
    let g:commandPalette = s:commandPalette
endif
