" Default Vim settings

" Key rebindings (try not to go overboard, need to be able to use vanilla vim)
" Discourage use of mouse and keyboard
set mouse=""
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

let mapleader=" "

" Colours
" Gruvbox setup (must be done before color set)
" https://github.com/morhetz/gruvbox
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_contrast_light='soft'

colorscheme gruvbox
set background=dark
syntax on

" Code aesthetic
set nowrap
set list
set listchars=precedes:<,extends:>,tab:>.,trail:!
set cursorline
set showmatch
set textwidth=79
" set textwidth=88
set titlestring=%r%m\ %t\ %y\ -\ VIM:\ the\ only\ text\ editor titlelen=80

" Line numbers
set number
set relativenumber

" Indentation
filetype plugin indent on
set backspace=indent,eol,start
set expandtab
set shiftwidth=4
set tabstop=4

" Always show status bar for airline
set laststatus=2
" Always show margin bar, otherwise LangClient makes text jump around
" while scrolling
 set signcolumn=yes

" In-code auto-completion
" Use languageserver
set completefunc=LanguageClient#complete
" noinsert required for ncm2
set completeopt=menu,preview,noinsert,menuone,noselect

" Let's get wild!!~
" set wildignore+=*ios/*
" set wildignore+=*plugins*
" set wildignore+=*release*
set wildignore+=*android/*
set wildignore+=*target/*
set wildignore+=*bazel-*
set wildignore+=*coverage*
set wildignore+=*dist*,*dist-server*
set wildignore+=*DS_Store*
set wildignore+=*node_modules*
set wildignore+=*platforms*
set wildignore+=*sass-cache*
set wildignore=*.o,*.obj,*~,*.pyc
set wildmenu
set wildmode=longest,list:full

" Plugin-specific settings

" Language Client setup
" Enable ncm2 autocompletion everywhere
autocmd BufEnter  *  call ncm2#enable_for_buffer()

" Required for operations modifying multiple buffers like rename.
set hidden

" Fix weird filetype for typescript .tsx files
autocmd BufNewFile,BufRead,BufReadPost  *.tsx   set filetype=typescript.tsx

" Fuck your recommended style!
let g:rust_recommended_style = 0

let g:LanguageClient_serverCommands = {
    \ 'rust': {
    \   'name': 'rust-analyzer',
    \   'command': ['rust-analyzer'],
    \   'initializationOptions': {
    \      'cargo': {
    \        'allFeatures': v:true,
    \      },
    \      'checkOnSave': {
    \        'allFeatures': v:true,
    \        'command': 'clippy',
    \      }
    \    }
    \ },
    \ 'python': ['pylsp'],
    \ 'go': ['gopls'],
    \ 'java': ['java-language-server'],
    \ 'javascript': ['./node_modules/.bin/typescript-language-server', '--stdio'],
    \ 'typescript': ['./node_modules/.bin/typescript-language-server', '--stdio'],
    \ 'typescript.tsx': ['./node_modules/.bin/typescript-language-server', '--stdio'],
    \ 'typescriptreact': ['./node_modules/.bin/typescript-language-server', '--stdio'],
    \ 'c': ['clangd'],
    \ 'cpp': ['clangd'],
    \ 'nix': ['rnix-lsp'],
    \ }

" let g:LanguageClient_settingsPath = '/home/denbeigh/.config/nvim/langclient.json'
let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'

" Airline setup
let g:airline#extensions#tabline#=1
let g:airline#extensions#tabline#enabled=1
let g:airline_interactive_collapse=1
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'

let g:rooter_patterns = ['go.mod', 'WORKSPACE', '.git/', 'Cargo.toml', 'pom.xml', '.gitignore']
let g:LangaugeClient_rootMarkers = ['go.mod']

" FZF Shortcut Bindings
nnoremap <leader>q :Rg<CR>
" nnoremap <leader>q :GFiles<CR>
nnoremap <leader>w :Files<CR>
nnoremap <leader>e :Buffers<CR>
nnoremap <leader>s :Lines<CR>
nnoremap <leader>d :BLines<CR>
nnoremap <leader>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>R :call LanguageClient#textDocument_references()<CR>
nnoremap <leader>f :call LanguageClient#textDocument_formatting()<CR>
nnoremap <leader>c :call LanguageClient#explainErrorAtPoint()<CR>
nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader><leader> :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>z :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <leader>Z :split<Bar>:call LanguageClient#handleCodeLensAction()<CR>

nnoremap <leader>x :call LanguageClient#workspace_executeCommand("Run")<CR>

" incsearch.vim keybindings
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

" Markdown preview options
" defaults copied from github page, then edited
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'relative',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
