CtrlP-CommandPalette
====================

![](https://raw.githubusercontent.com/dbeecham/dbeecham.github.com/master/commandpalette.gif)

This is an extension for `CtrlP <https://github.com/kien/ctrlp.vim>` which adds
a command palette akin to the ones found in Atom or Sublime Text.

It's built upon the works of Juan Pedro Fisanotti `juandev
<https://github.com/juandev>` (thank you!), though I felt that the changes were
major enough to warrant a new project.


Installation
------------

Since this is an extension to CtrlP, you need to first install CtrlP.

The preferred way to install CtrlP-Command-Palette is to use a package manager like Plug or Vundle.
Just add ``Plug 'dbeecham/ctrlp-command-palette.vim'`` (or ``Bundle
'dbeecham/ctrlp-command-palette.vim'`` if you use Vundle) to your .vimrc and
``PlugInstall`` (or ``BundleInstall``). 


Usage
-----

Spawn CtrlP-CommandPalette using ``:CtrlPCommandPalette``. It's probably a good
idea to bind this to some key:

    nnoremap <leader>t :CtrlPCommandPalette<cr>


TODO: write about the dictionaryj

Options
-------

TODO


Thanks
------

A special thanks to Juan Pedro Fisanotti `juandev
<https://github.com/juandev>` for his works on CtrlP-CmdPalette
