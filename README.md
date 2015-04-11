# vimsettings

Make your VIM settings update as you work on different files.  Ever had to
`:set et` / `:set noet` manually while navigating through different files?
`vimsettings` lets you override some VIM settings on a per directory level.

## Installation

Just make sure that `vimsettings.vim` is installed as a plugin into your VIM.
If you use a plugin manager like
[pathogen.vim](https://github.com/tpope/vim-pathogen), it is as simple as

    cd ~/.vim/bundle
    git clone git://github.com/aalexand/vimsettings.git

## Usage

Create a file named `.vimsettings` in the directory which should use slightly
different VIM settings for its files and put the settings into the file, e.g.

    set ts=4 sw=4 sts=4 noet

When you open in VIM a file from this directory or any of its subdirectories,
the `.vimsettings` file will be evaluated and the settings will be applied.
There may be multiple `.vimsettings` files in the hierarchy, they are evaluated
bottom up so that settings in the deeper files win.

You can also do per file type settings with something like

    if &filetype == 'cpp' || &filetype == 'python'
      set sw=2 sts=4 ts=8 et
    endif

I think that's it.
