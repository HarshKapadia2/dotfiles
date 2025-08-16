# Vim

This directory contains `.vimrc` dotfiles for [Vim](https://www.vim.org).

The [base](base) directory contains a `.vimrc` file that only configures the
editor's in-built settings and has no external dependencies in terms of
packages or plugins.

The [plugins](plugins) directory contains a `.vimrc` file that uses
[vim-plug](https://github.com/junegunn/vim-plug) to install and manage Vim
plugins. This file also includes all the settings from the above 'base' `.vimrc`
file.

More usage instructions can be found in [the `--vim` option's
documentation](README.md#documentation).
