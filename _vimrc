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


" vim �ڲ�ʹ�õı��룬Ĭ��ʹ�� latin1���ĳ�ͨ�õ� utf8 ���룬��������
set encoding=utf-8

" �ļ�����̽���б�
" vim ������ʱ�������ʹ�ñ������еı�����ļ����ݽ��н���
" �����������ʧ�ܣ�����ʹ����һ������
" ����������������� windows �µ� gb2312, gbk, gb18030 �ȱ��뵼�µ�
" ����̽��һ�� utf8 �� gbk ����Ӧ������������
set fileencodings=utf-8,gb18030

" �ڲ���ģʽ���س�ʱ vim ���Զ�������һ�е�������������
set autoindent

" ���� vim ɾ��/�˸����Ϊ
" ԭ���� vim ��Ϊ�е�֣�
" �������һ�еĿ�ͷ�л�������ģʽ����ʱ���˸��޷��˵���һ��
" �������һ�е�ĳһ���л�������ģʽ����ʱ���˸��޷���ɾ����һ��֮ǰ���ַ�
" ����㿪���� autoindent�����س�ʱ vim �������һ���Զ���������ʱ���˸��޷�ɾ�������ַ�
" ͨ������ eol, start �� indent ��������������Ϊ
set backspace=eol,start,indent

" vim Ĭ��ʹ�õ�����ʾ״̬������Щ�����Ҫʹ��˫��չʾ������ֱ����� 2
set laststatus=2

" ������ 80 �У��Ƽ�
set colorcolumn=80

" ������������У��Ƽ�
" ���˻��������ǰ�У�����ͨ�� set cursorcolumn ���������е���ˣ����Ƽ�
set cursorline

" ��ʾ���ڱȽ�С��ʱ������չʾ����Ȼ��Ҫˮƽ��ҳ���Ƽ�
set linebreak

" �����﷨����
syntax on

" Set the font family and size
set guifont=Consolas:h11

" �����Զ�ʶ���ļ����ͣ��������ļ����ͼ��ز�ͬ�Ĳ������������
filetype plugin indent on

" Theme
syntax enable
colorscheme tender

" ʵ��vim�����ճ������
set clipboard=unnamedplus
