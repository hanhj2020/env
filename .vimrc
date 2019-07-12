map <F9> :call SaveInputData()<CR>
func! SaveInputData()
	exec "tabnew"
	exec 'normal "+gP'
	exec "w! /tmp/input_data"
endfunc
"colorscheme torte
"colorscheme murphy
"colorscheme desert 
colorscheme elflord
"colorscheme ron
"colorscheme blue
"colorscheme peachpuff
"colo evening
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
"winpos 5 5          " 设定窗口位置  
"set lines=40 columns=155    " 设定窗口大小  
set go=             " 不要图形按钮  
"color asmanian2     " 设置背景主题  
"set guifont=Courier_New:h10:cANSI   " 设置字体  
syntax on           " 语法高亮  
"autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
"autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
"set cmdheight=1     " 命令行（在状态行下）的高度，设置为1  
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)  
"set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
set novisualbell    " 不要闪烁(不明白)  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)  
"set background=dark "背景使用黑色 

" 设置配色方案
"colorscheme murphy
"字体 
"if (has("gui_running")) 
"   set guifont=Bitstream\ Vera\ Sans\ Mono\ 10 
"endif 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func SetTitle_common()
	call setline(1, "/*")
	call append(line("."), " * File Name: ".expand("%")) 
	call append(line(".")+1, " * Author: hanhj") 
	call append(line(".")+2, " * Mail: hanhj@zx-jy.com ") 
	call append(line(".")+3, " * Created Time: ".strftime("%Y-%m-%d %T week:%w")) 
	call append(line(".")+4, "*/") 
endfunc
func SetTitle_cpp()
	call SetTitle_common()
	call append(line(".")+5, "#include<iostream>")
	call append(line(".")+6, "using namespace std;")
	call append(line(".")+7, "") 
	call append(line(".")+8, "// vim:tw=72 ")
	"新建文件后，自动定位到文件末尾
	normal G1kO
endfunc
func SetTitle_c()
	call SetTitle_common()
	call append(line(".")+5, "#include<stdio.h>")
	call append(line(".")+6, "")
	call append(line(".")+7, "// vim:tw=72 ")
	normal G1kO
endfunc
func SetTail()
	call append(winline(), "// vim:tw=72 ")
endfunc
func SetTitle_h()
	call SetTitle_common()
	call append(line(".")+5, "#ifndef __".expand("%:r")."_".expand("%:e"))
	call append(line(".")+6, "#define __".expand("%:r")."_".expand("%:e"))
	call append(line(".")+7, "#endif //__".expand("%:r")."_".expand("%:e"))
	call append(line(".")+8, "// vim:tw=72 ")
	normal G1kO 
endfunc
func SetTitle_java()
	call SetTitle_common()
	call append(line(".")+5,"public class ".expand("%"))
	call append(line(".")+6,"")
	normal GO
endfunc
func SetTitle_sh()
	call setline(1, "\# File Name: ".expand("%")) 
	call append(line("."), "\# Author: hanhj") 
	call append(line(".")+1, "\# mail: hanhj@zx-jy.com") 
	call append(line(".")+2, "\# Created Time: ".strftime("%Y-%m-%d %T week:%w")) 
	call append(line(".")+3, "\#!/bin/bash") 
	call append(line(".")+4, "\# vim:tw=72 ")
	normal GO
endfunc
func SetTitle_tex()
	call setline(1,"%File Name:".expand("%"))
	call append(line("."), "%Created Time: ".strftime("%Y-%m-%d %T week:%w")) 
	call append(line(".")+1, "%Author: hanhj") 
	call append(line(".")+2, "%Mail: hanhj@zx-jy.com ") 
	call append(line(".")+3, "\\documentclass{article}") 
	call append(line(".")+4, "\\usepackage{xeCJK}") 
	call append(line(".")+5, "\\usepackage{graphicx}") 
	call append (line(".")+6, "\\usepackage[breaklinks,colorlinks,linkcolor=black,citecolor=black,urlcolor=black]{hyperref}")
	call append(line(".")+7, "\\usepackage{indentfirst}") 
	call append(line(".")+8, "\\setCJKmainfont{AR PL UMing CN}") 
	call append(line(".")+9, "\\begin{document}") 
	call append(line(".")+10, "\\end{document}")
	normal GO
endfunc
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *  exec ":call SetTitle()" 
autocmd BufNewFile *.py 0r ~/.vim/template/pyconfig.py 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	if &filetype == 'sh' 
		call SetTitle_sh()
	elseif &filetype == 'cpp'
		call SetTitle_cpp()
	elseif &filetype == 'c'
		call SetTitle_c()
	elseif &filetype == 'h'
		call SetTitle_h()
	elseif &filetype == 'java'
		call SetTitle_java()
	elseif &filetype == 'plaintex'
		call SetTitle_tex()
	endif
endfunc 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"切换当前编辑窗口到下一个文件标签
nmap bn :bn<cr>
"切换当前编辑窗口到上一个文件标签
nmap mm :bp<cr>
"跳转文件头部
"nmap ee G<cr>
"退出vi
"nmap qq :q<cr>
"保存文件
nmap ss :w<cr>
"从磁盘重新装载当前文件
"nmap tt :e<cr>
"nmap qa :qa<cr>
"nmap <leader>w :w!<cr>
"nmap <leader>f :find<cr>

" 映射全选+复制 ctrl+a
"nmap <C-A> ggVGY
"map! <C-A> <Esc>ggVGY

"缩进
nmap <F12> gg=G

" 选中状态下 Ctrl+c 复制
"vmap <C-c> "+y
"直接用y不就行了

"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
nnoremap <C-F2> :vert diffsplit 
"列出当前目录文件  
map <F3> :tabnew .<CR>  
"打开树状文件目录  
map <C-F3> \be  
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
	elseif &filetype == 'sh'
		:!./%
	elseif &filetype == 'py'
		exec "!python %"
		exec "!python %<"
	endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!gcc % -g -o %<"
	exec "!gdb ./%<"
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
"set completeopt=preview,menu 
"允许插件  
"filetype plugin indent  on
"共享剪贴板  
set clipboard+=unnamed 
"从不备份  
set nobackup
"make 运行
"set makeprg=g++\ -Wall\ \ %
"自动保存
set autowrite
"set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" 设置在状态行显示的信息
"set foldcolumn=0
set foldmethod=indent 
set foldlevel=20 
"set foldenable              " 开始折叠
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
" 语法高亮
set syntax=on
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
"set noignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"语言设置
set langmenu=zh_CN.UTF-8
"set helplang=cn "没用
"编码设置
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
" 我的状态行显示的内容（包括文件类型和解码）
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
"装入man，可以在vim中使用man
source $VIMRUNTIME/ftplugin/man.vim	
" 高亮显示普通txt文件（需要txt.vim脚本）
"au BufRead,BufNewFile *  setf txt
"inoremap 在插入模式下非递归映射。i:insert, nore:no recuision
"c-xx	代表ctrl
"s-xx	代表shift
"a-xx	代表alt
"fxx	代表F按键
"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap } <c-r>=ClosePair('}')<CR>
autocmd  FileType c,cpp inoremap { {<CR>}<ESC>O
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
"定义在插入模式下的光标移动
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-j> <down>
inoremap <c-k> <up>
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"cscope 设定
cs add cscope.out
"set cscopetag
set tags+=tags
"find c symbol"
nmap <C-\>s :cs f s <C-R>=expand("<cword>")<CR><CR>
"find define"
nmap <C-\>g :cs f g <C-R>=expand("<cword>")<CR><CR>
"find functions called by this function"
nmap <C-\>d :cs f d <C-R>=expand("<cword>")<CR><CR>
"find functions calling this function"
nmap <C-\>c :cs f c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs f t <C-R>=expand("<cword>")<CR><CR>
"taglist设定
"不同时显示多个文件tag，只显示当前文件的tag"
let Tlist_Show_One_File=1
let Tlist_OnlyWindow=1
"让当前不被编辑的文件的方法列表自动折叠起来
let Tlist_File_Fold_Auto_Close=1
"把taglist窗口放在屏幕右侧，缺省放在左侧
let Tlist_Use_Right_Window=1
"显示taglist菜单
let Tlist_Show_Menu=1
"启动vim时自动打开taglist
"let Tlist_Auto_Open=1
"winmanager设定
let loaded_winmanager=1
let g:winManagerWindowLayout = 'FileExplorer|TagList'
let g:winManagerWindowLayout = 'NERDTree|TagList'
let g:winManagerWindowLayout = 'NERDTree|TagList,BufExplorer'
let g:winManagerWindowLayout = 'NERDTree|TagList,BufExplorer'
let g:winManagerWindowLayout = 'NERDTree|Tagbar'
let g:AutoOpenWinManager=1
nmap wm :WMToggle<CR>
"tagbar设定
"use by winmanager
let g:Tagbar_title="[Tagbar]"
function! Tagbar_Start()
	exe 'q'
	exe 'TagbarOpen'
endfunction
function! Tagbar_IsValid()
	return 1
endfunction
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
"NERDtree设定
"use by winmanager
let g:NERDTree_title="[NERDTree]"
function! NERDTree_Start()
	exe 'q'
	exe 'NERDTree'
endfunction
function! NERDTree_IsValid()
	return 1
endfunction
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31
"OmniCpp
let OmniCpp_NamespsceSearch=1
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_ShowAccess=1
let OmniCpp_MayCompleteDot=1
let OmniCpp_MayCompleteArrow=1
let OmniCpp_MayCompleteScope=1
let OmniCpp_DefauletNamespaces=["std","_GLIBCXX_STD"]
"设置补全窗口的颜色
highlight Pmenu guibg=darkgrey guifg=black
highlight PmenuSel guibg=lightgrey guifg=black
