source $VIMRUNTIME/vimrc_example.vim

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('D:\Program Files (x86)\Vim\vimfiles\myplugin')

Plug 'mhinz/vim-startify'

" Themes
" colorscheme tender
Plug 'jacoborus/tender.vim'
" colorscheme one
Plug 'rakr/vim-one'
" colorscheme palenight
Plug 'drewtempelmeyer/palenight.vim'
" colorscheme neodark
Plug 'KeitaNakamura/neodark.vim'
" colorscheme NeoSolarized
Plug 'iCyMind/NeoSolarized'
" colorscheme monokai
Plug 'crusoexia/vim-monokai'
" colorscheme gruvbox
Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Initialize plugin system
call plug#end()

" open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif


" vim 内部使用的编码，默认使用 latin1，改成通用的 utf8 编码，避免乱码
set encoding=utf-8

" 文件编码探测列表
" vim 启动的时候会依次使用本配置中的编码对文件内容进行解码
" 如果遇到解码失败，则尝试使用下一个编码
" 常见的乱码基本都是 windows 下的 gb2312, gbk, gb18030 等编码导致的
" 所以探测一下 utf8 和 gbk 足以应付大多数情况了
set fileencodings=utf-8,gb18030

" 在插入模式按回车时 vim 会自动根据上一行的缩进级别缩进
set autoindent

" 修正 vim 删除/退格键行为
" 原生的 vim 行为有点怪：
" 如果你在一行的开头切换到插入模式，这时按退格无法退到上一行
" 如果你在一行的某一列切换到插入模式，这时按退格无法退删除这一列之前的字符
" 如果你开启了 autoindent，按回车时 vim 会根据上一行自动缩进，这时按退格无法删除缩进字符
" 通过设置 eol, start 和 indent 可以修正上述行为
set backspace=eol,start,indent

" vim 默认使用单行显示状态，但有些插件需要使用双行展示，不妨直接设成 2
set laststatus=2

" 高亮第 80 列，推荐
set colorcolumn=80

" 高亮光标所在行，推荐
" 有人还会高亮当前列，可以通过 set cursorcolumn 开启，但有点过了，不推荐
set cursorline

" 显示窗口比较小的时候折行展示，不然需要水平翻页，推荐
set linebreak

" 开启语法高亮
syntax on

" Set the font family and size
set guifont=Consolas:h11

" 开启自动识别文件类型，并根据文件类型加载不同的插件和缩进规则
filetype plugin indent on

" Theme
syntax enable
colorscheme tender

" 实现vim与外界粘贴复制
set clipboard=unnamedplus
