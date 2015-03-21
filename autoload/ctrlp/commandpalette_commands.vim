
" Number line {{{
let s:relativeNumbers = &relativenumber
let s:absoluteNumbers = &number

function! ctrlp#commandpalette_commands#ToggleRelativeNumbers()
    let s:relativeNumbers = !s:relativeNumbers
    set relativenumber!
endfunction

function! ctrlp#commandpalette_commands#ToggleAbsoluteNumbers()
    let s:absoluteNumbers = !s:absoluteNumbers
    set number!
endfunction

function! ctrlp#commandpalette_commands#ToggleNumbers()
    " if number and relativenumber is on, toggle them both
    if &number && &relativenumber
        set number!
        set relativenumber!
        return
    endif

    " If both off, turn on whichever the user wants (s:relativeNumbers and
    " s:absoluteNumbers)
    if !(&number && &relativenumber)
        if s:absoluteNumbers
            set number!
        end

        if s:relativeNumbers
            set relativenumber!
        end

        return
    endif

    " if number is on, toggle it.
    if &number
        set number!
        return
    endif

    " if function reaches this point, relativenumber is on and number is off.
    set relativenumber!
    return

endfunction
" }}}

" Syntax {{{
function! ctrlp#commandpalette_commands#ToggleSyntax()
    if exists("g:syntax_on")
        syntax off
    else
        syntax on
    endif
endfunction

function! ctrlp#commandpalette_commands#SetSyntax()
    let l:newsyntax = input('Set syntax to: ', &syntax, 'syntax')
    execute "set syntax=" . l:newsyntax
endfunction
" }}}

function! ctrlp#commandpalette_commands#OpenFile()
    let l:newfile = input('Open: ', '', 'file')
    if !empty(l:newfile)
        execute "open " . l:newfile
    endif
endfunction

function! ctrlp#commandpalette_commands#SaveAs()
    let l:newfile = input('Save as: ', '', 'file')
    if !empty(l:newfile)
        execute "saveas " . l:newfile
    endif
endfunction


" The commandPalette dictionary of built-in commands.
let s:commandPalette = {
    \ 'Unprintable characters: Toggle display': 
    \   'set list!',
    \ 'Line numbers: Toggle relative':
    \   'call ctrlp#commandpalette_commands#ToggleRelativeNumbers()',
    \ 'Line numbers: Toggle absolute':
    \   'call ctrlp#commandpalette_commands#ToggleAbsoluteNumbers()',
    \ 'Line numbers: Toggle visible': 
    \   'call ctrlp#commandpalette_commands#ToggleNumbers()',
    \ 'Build (make)':
    \   'make',
    \ 'Window: Split horizontally':
    \   'split',
    \ 'Window: Split vertically':
    \   'vsplit',
    \ 'Paste mode: Toggle':
    \   'set paste!',
    \ 'Syntax highlighting: Set':
    \   'call ctrlp#commandpalette_commands#SetSyntax()',
    \ 'Syntax highlighting: Toggle':
    \   'call ctrlp#commandpalette_commands#ToggleSyntax()',
    \ 'File: Open':
    \   'call ctrlp#commandpalette_commands#OpenFile()',
    \ 'Buffers: New empty':
    \   'enew',
    \ 'Buffers: Select':
    \   'CtrlPBuffer',
    \ 'Buffers: Close':
    \   'bdelete',
    \ 'Buffers: List':
    \   'buffers',
    \ 'Quit':
    \   'quit',
    \ 'Save':
    \   'write',
    \ 'Save as':
    \   'call ctrlp#commandpalette_commands#SaveAs()'
    \ }

" Add commands to g:commandPalette.
if exists("g:commandPalette")
    call extend(g:commandPalette, s:commandPalette, "keep")
else
    let g:commandPalette = s:commandPalette
endif
