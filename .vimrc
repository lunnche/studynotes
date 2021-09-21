syntax on " Enable syntax highlighting.
filetype indent on
filetype plugin on
filetype plugin indent on " Enable file type based indentation.
set autoindent " Respect indentation when starting a new line.
set expandtab " Expand tabs to spaces. Essential in Python.
set tabstop=4 " Number of spaces tab is counted for.
set shiftwidth=4 " Number of spaces to use for autoindent.
set backspace=2 " Fix backspace behavior on most terminals.
colorscheme murphy " Change a colorscheme.
packloadall "加载所有插件
silent! helptags ALL "为所有插件加载帮助文档
"为YouCompleteMe增加vim-plug的超时时间

"使用vim-plug管理插件
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-janah'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
    let g:vim_markdown_math = 1
Plug 'mzlogin/vim-markdown-toc'
    let g:vmt_auto_update_on_save = 0
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
    let g:mkdp_path_to_chrome = ""
    " 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）
    " 如果设置了该参数, g:mkdp_browserfunc 将被忽略
    let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
    " vim 回调函数, 参数为要打开的 url
    let g:mkdp_auto_start = 0
    " 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
    " markdown 文件的时候打开一次
    let g:mkdp_auto_open = 0
    " 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预
    " 览窗口
    let g:mkdp_auto_close = 1
    " 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
    " 自动关闭预览窗口
    let g:mkdp_refresh_slow = 0
    " 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
    " 更新预览
    let g:mkdp_command_for_global = 0
    " 设置为 1 则所有文件都可以使用 MarkdownPreview 进行预览，默认只有 markdown
    " 文件可以使用改命令
    let g:mkdp_open_to_the_world = 0
    " 设置为 1, 在使用的网络中的其他计算机也能访问预览页面
    " 默认只监听本地（127.0.0.1），其他计算机不能访问
    nmap <silent> <F8> <Plug>MarkdownPreview        " 普通模式
    imap <silent> <F8> <Plug>MarkdownPreview        " 插入模式
    nmap <silent> <F9> <Plug>StopMarkdownPreview    " 普通模式
    imap <silent> <F9> <Plug>StopMarkdownPreview    " 插入模式

Plug 'lervag/vimtex'
let g:vimtex_latexmk_option='pdf -pdflatex="xelatex -synctex=1 \%S \%O" -verbose -file-line-error -interaction=nonstopmode'
    let g:tex_flavor= 'latex'
    "let g:vimtex_view_method= 'Skim'
    let g:vimtex_quickfix_mode=0
    set conceallevel=1
    let g:tex_conceal= 'abdmg'

Plug 'xuhdev/vim-latex-live-preview',{'for':'tex'}

Plug 'SirVer/ultisnips'
   let g:UltiSnipsSnippetDirectories=['Ultisnips']
  "let g:UltiSnipsSnippetsDir = '~/.vim/Ultisnips'


   "设置tab键为触发键
   let g:UltiSnipsExpandTrigger = '<tab>'
    "设置向后跳转键
   let g:UltiSnipsJumpForwardTrigger = '<tab>' 
    "设置向前跳转键
   let g:UltiSnipsJumpBackwardTrigger = '<S-tab>' 
    "设置打开配置文件时为垂直打开
   let g:UltiSnipsEditSplit="vertical"
"Plug 'honza/vim-snippets'

call plug#end()
set foldmethod=indent
noremap ; : 



"设置欢迎图像

let g:startify_custom_header = [
 \ ' _____         __      ',
 \ '/\  __`\    __/\ \__   ',
 \ '\ \ \/\ \  /\_\ \  _\  ',
 \ ' \ \ \ \ \ \/\ \ \ \/  ',
 \ '  \ \ \\ \\ \ \ \ \_\_ ',
 \ '   \ \___\_\_\ \ \ \__\',
 \ '    \/__//_/\ \_\ \/__/',
 \ '           \ \____/    ',
 \ '            \/___/     ',
 \]

