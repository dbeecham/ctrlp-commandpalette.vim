CtrlP-CommandPalette
====================

![](https://raw.githubusercontent.com/dbeecham/dbeecham.github.com/master/commandpalette.gif)

This is an extension for [CtrlP](https://github.com/kien/ctrlp.vim) which adds
a "Command Palette" akin to the ones found in Atom or Sublime Text.

It's built upon the works of Juan Pedro Fisanotti ([juandev](https://github.com/juandev)) (thank you!), 
though I felt that the changes were major enough to warrant a new project.

It is very much a new project, and still has a certain want of build-in commands. 
If you have any ideas for commands to implement, or comments
about current functionality, [create an
issue](https://github.com/dbeecham/ctrlp-commandpalette.vim/issues) or [drop a line in
gitter](https://gitter.im/dbeecham/ctrlp-commandpalette.vim)!


Installation
------------

A quick way to get going with CtrlP and CtrlP-CommandPalette is using one of the
many vim package managers like [Plug](https://github.com/junegunn/vim-plug),
[Vundle](https://github.com/gmarik/Vundle.vim), or
[Neobundle](https://github.com/Shougo/neobundle.vim).

If you use Plug, Add `Plug 'kien/ctrlp.vim'` and 
`Plug 'dbeecham/ctrlp-commandpalette.vim` to your .vimrc and run `:PlugInstall`.
If you use some other package manager, then do whatever that package manager
wants you to do to install this package along with CtrlP.



Usage
-----

Spawn CtrlP-CommandPalette using ``:CtrlPCommandPalette``. It's probably a good
idea to bind this to some key:

    nnoremap <leader>t :CtrlPCommandPalette<cr>


The command palette uses a simple dictionary (`:help Dictionary`) for all
commands. If you want to create your own commands, simply define this dictionary
yourself in your .vimrc, example:

    let g:commandPalette = {
        \ 'Ignorecase: Toggle': 'set ignorecase!',
        \ 'File: save and close': 'wc',
        \ 'Run my custom function': 'call MyFunction()'}

* CtrlP-CommandPalette will append all built-in commands to this list when
initialized (when spawning for the first time). 
* The keys (the searchable
strings) must be unique. 
* You can alter the commandPalette at any time. 
* CtrlP-CommandPalette will not overwrite any entries in the
dictionary, so to overwrite built-in behaviour, simply create an entry with the
same key as the one you wish to overwrite.


Options
-------

To completely disable the built-in commands for CtrlP-CommandPalette, add this
to your .vimrc:

    let g:ctrlp_commandpalette_autoload_commands = 0



Thanks
------

A special thanks to Juan Pedro Fisanotti `juandev
<https://github.com/juandev>` for his works on CtrlP-CmdPalette
