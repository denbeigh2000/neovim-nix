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

" LSP base configuration
lua <<EOF
  require'lspconfig'.rust_analyzer.setup{}

  require'lspconfig'.pylsp.setup{
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            -- TODO
            -- ignore = {'W391'},
            -- maxLineLength = 100
          }
        }
      }
    }
  }
  require'lspconfig'.gopls.setup{}
  require'lspconfig'.java_language_server.setup{}
  require'lspconfig'.tsserver.setup{}
  require'lspconfig'.clangd.setup{}
  require'lspconfig'.rnix.setup{}
EOF

" Airline setup
let g:airline#extensions#tabline#=1
let g:airline#extensions#tabline#enabled=1
let g:airline_interactive_collapse=1
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'

let g:rooter_patterns = ['go.mod', 'WORKSPACE', '.git/', 'Cargo.toml', 'pom.xml', '.gitignore']
" let g:LangaugeClient_rootMarkers = ['go.mod']

" FZF Shortcut Bindings
nnoremap <leader>q :Rg<CR>
" nnoremap <leader>w :GFiles<CR>
nnoremap <leader>w :Files<CR>
nnoremap <leader>e :Buffers<CR>
nnoremap <leader>s :Lines<CR>
nnoremap <leader>d :BLines<CR>

" Language server keybindings
lua <<EOF
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename())
  vim.keymap.set('n', '<leader>R', vim.lsp.buf.references())
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting())
  vim.keymap.set('n', '<leader><leader>', vim.lsp.buf.type_definition())
  vim.keymap.set('n', '<leader>z', vim.lsp.buf.code_action())
  -- vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover())
  vim.keymap.set('n', '<leader>x', vim.lsp.buf.run())
EOF

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
