"----------------------------------------------------
"" Vundle
"----------------------------------------------------

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Managed Plugnins by Vundle
Bundle 'gmarik/vundle'

"Githubにホストされているプラグイン
Bundle 'thinca/vim-localrc'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
Bundle 'tpope/vim-rails'
Bundle 'tyru/open-browser.vim'
Bundle 'Lokaltog/vim-easymotion'

"www.vim.orgにホストされているプラグイン

"その他にホストされているプラグイン
Bundle 'railstab.vim'
Bundle 'railscasts'
Bundle 'ZenCoding.vim'
Bundle 'mrtazz/molokai.vim'
Bundle 'tyru/restart.vim'
filetype plugin indent on
