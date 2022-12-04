let $LANG='en_US'					" 语言
syntax on 			    			" 自动高亮语法
filetype on						" 文件类型侦测
set encoding=utf-8					" 编码格式
set vb t_vb=            				" 关闭提示音
set nocompatible					" 去除vi特性
set nu 				    			" 显示行号
set showcmd						" 显示输出命令
set background=dark					" 背景
set scrolloff=5						" 保留行数
" set cursorline					" 突出当前行
set laststatus=2      					" 显示状态栏
set autoindent						" 自动缩进
set smartindent						" C智能缩进
set backspace=2						" 允许backspace和光标键跨行边界
set showmatch						" 高亮显示匹配的括号
set nobackup						" 禁止生成临时文件
set mouse=a 						" 启用鼠标
set updatetime=100
set t_Co=256
let mapleader=" "

call plug#begin()

Plug 'arcticicestudio/nord-vim'

Plug 'neoclide/coc.nvim'
Plug 'airblade/vim-gitgutter'

Plug 'junegunn/fzf'
 
call plug#end()

"===Theme==="
colorscheme nord

"===FZF==="
map <Space>ff :FZF<CR>

"===Coc.nvim Config==="
let g:coc_global_extensions = [
			\ 'coc-clangd',
			\ 'coc-tsserver',
			\ 'coc-eslint',
			\ 'coc-react-refactor',
			\ 'coc-json',
			\ 'coc-snippets']

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('K', 'in')
	endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

"===Coc.nvim Config==="

