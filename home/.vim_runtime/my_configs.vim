"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" necessary options for vimwiki:
" https://github.com/vimwiki/vimwiki#prerequisites
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype plugin on
syntax on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" configuration for vimwiki
" https://stackoverflow.com/questions/15959601/setting-vimwiki-defaults
" https://gist.github.com/giantryansaul/c2d3163ae87e6bae76f3aed3fa46197e
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vimwiki_list = [{'path':'~/.notes/wiki', 'path_html':'~/.notes/export/html/', 'syntax': 'markdown', 'ext': '.md'}]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't fold markdown lists on initial open:
" https://github.com/plasticboy/vim-markdown#disable-folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vim_markdown_folding_disabled = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" add keybindings for vertical and horizontal split in vimwiki, default
" bindings don't work, because <C-CR> and <S-CR> are not differentiated from
" <CR> in terminator / gnome-terminal:
" https://stackoverflow.com/questions/598113/can-terminals-detect-shift-enter-or-control-enter#comment75080243_598404
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <C-k> :VimwikiVSplitLink<CR>
nmap <C-l> :VimwikiSplitLink<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always show line numbers
" https://stackoverflow.com/a/10274166
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use and configure vim-easymotion plugin
" https://github.com/easymotion/vim-easymotion#installation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
 
"" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)"

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" add incremental search plugin
" https://github.com/haya14busa/incsearch.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" add incremental search fuzzy search plugin
" https://github.com/haya14busa/incsearch-fuzzy.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map z/ <Plug>(incsearch-fuzzy-/)
" map z? <Plug>(incsearch-fuzzy-?)
" map zg/ <Plug>(incsearch-fuzzy-stay)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" add incremental search vim-easymotion plugin
" https://github.com/haya14busa/incsearch-easymotion.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" combine incremental search, fuzzy search and vim-easymotion 
" https://github.com/haya14busa/incsearch-easymotion.vim#incremental-fuzzymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
      \   'converters': [incsearch#config#fuzzy#converter()],
      \   'modules': [incsearch#config#easymotion#module()],
      \   'keymap': {"\<CR>": '<Over>(easymotion)'},
      \   'is_expr': 0,
      \   'is_stay': 1
      \ 
      \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight matched pattern separately with forward matches and backward matches.
" @see: ':h incsearch.vim' > Hightlight section (`incsearch-highlight`)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:incsearch#separate_highlight = 1

" Set colors for search matches
hi Search ctermfg=88 ctermbg=186 guifg=#800000 guibg=#d0d090
hi IncSearch ctermfg=88 ctermbg=186 guifg=#800000 guibg=#d0d090
hi link IncSearchMatch Cursor 
hi IncSearchMatchReverse ctermfg=238 ctermbg=117 guifg=#444444 guibg=#8ac6f2 
hi link IncSearchCursor Cursor 
hi link IncSearchOnCursor Cursor 
hi link IncSearchUnderline Cursor 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't show mode on its own line (line itself stays, unfortunately)
" @see: https://superuser.com/a/450408
" @see: https://stackoverflow.com/a/30228762
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode
set cmdheight=1
