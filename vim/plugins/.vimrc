" This base template has been modified and taken from 'The Missing Semester of
" Your CS Education' that can be found at
" https://missing.csail.mit.edu/2020/editors/#:~:text=Download%20our%20config%20here%20and%20save%20it%20to%20~/.vimrc.
" Modifications to the base template have been made.

" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Set custom leader key to define custom mappings that don't interfere with
" built-in commands
let mapleader = ","

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
" set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Highlight search matches
set hlsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Add an additional keybinding to escape (<ESC>) from insert mode
inoremap jj <ESC>

" Prevent '$' from selecting the trailing new line character
vnoremap $ g_

" Toggle colorcolumn in the current (local) buffer
" Checks the effective colorcolumn value (post global and local value effects)
" and then sets or unsets the local value
nnoremap <silent> <leader>cc :if &colorcolumn == 80 <Bar> setlocal colorcolumn= <Bar> else <Bar> setlocal colorcolumn=80 <Bar> endif <CR>

" Make popups scrollable
" Credits to https://vi.stackexchange.com/questions/37717/is-it-possible-to-scroll-a-popup-via-keyboard
function! ScrollPopup(scroll_num_lines)
    let popup_win_ids = popup_list()

    if len(popup_win_ids) == 0
        return
    endif

    let popup_posn_properties = popup_getpos(popup_win_ids[0])

    if popup_posn_properties.visible != 1
        return
    endif

    let first_line = popup_posn_properties.firstline + a:scroll_num_lines
    let buf_last_line = str2nr(trim(win_execute(popup_win_ids[0], "echo line('$')")))

    if first_line < 1
        let first_line = 1
    elseif popup_posn_properties.lastline + a:scroll_num_lines > buf_last_line
        let first_line = buf_last_line + popup_posn_properties.firstline - popup_posn_properties.lastline
    endif

    call popup_setoptions(popup_win_ids[0], {'firstline': first_line})
endfunction

" Scroll down
" Normal comments cannot be along the line for mappings. There is some special
" way to add comments along the line
nnoremap <silent> <C-j> :call ScrollPopup(3)<CR>
" Scroll up
nnoremap <silent> <C-k> :call ScrollPopup(-3)<CR>


" ------------------------- Plugins -------------------------------


" Install 'vim-plug' plugin manager (if it isn't already installed)
" https://github.com/junegunn/vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Install plugins using 'vim-plug'
call plug#begin('~/.vim/plugged')


" EditorConfig: https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'

" Shell formatting: https://github.com/z0mbix/vim-shfmt
" Needs `shfmt` package
Plug 'z0mbix/vim-shfmt'

" ShellCheck: https://github.com/itspriddle/vim-shellcheck
" Needs `shellcheck` package
Plug 'itspriddle/vim-shellcheck'

" Prettier: https://github.com/prettier/vim-prettier
" Needs `prettier` installed globally (which needs `nodejs` installed)
" `--legacy-peer-deps` npm flag required due to Prettier PHP plugin version
" mismatch
Plug 'prettier/vim-prettier', {
	\ 'do': 'npm install --omit=dev --legacy-peer-deps',
	\ 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact',
	\ 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte',
	\ 'yaml', 'html']
	\ }

" Clang Format: https://github.com/rhysd/vim-clang-format
" Needs `clang-format` package
Plug 'rhysd/vim-clang-format'

" YouCompleteMe: https://github.com/ycm-core/YouCompleteMe
" Needs `build-essential`, `cmake` and `python3-dev` packages
" Needs `bear` package to generate compilation DB for C family languages
" User needs to be use `bear` manually to generate `compile_commmands.json`
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer' }

" commentary.vim: https://github.com/tpope/vim-commentary
Plug 'tpope/vim-commentary'


call plug#end()


" 'editorconfig-vim' plugin options
let g:EditorConfig_max_line_indicator = "none"

" 'vim-shfmt' plugin options
" Args: https://github.com/mvdan/sh/blob/master/cmd/shfmt/shfmt.1.scd
let g:shfmt_extra_args = '-bn -ci -sr -kp'
let g:shfmt_fmt_on_save = 1

" 'vim-prettier' plugin options
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" 'vim-clang-format' plugin options
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_filetypes = ["c", "cpp"]
let g:clang_format#auto_format = 1

" 'YouCompleteMe' plugin options
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" 'commentary.vim' plugin
filetype indent plugin on " Affects entire file and suggested by plugin owner
" `Ctrl + /` maps to `Ctrl + _` on Linux - use `showkey -a` to check
xnoremap <C-/> :Commentary<CR>
xnoremap <C-_> :Commentary<CR>
