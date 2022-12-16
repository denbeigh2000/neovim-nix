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
set completeopt=menu,preview,menuone,noselect

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
" autocmd BufEnter  *  call ncm2#enable_for_buffer()

" Required for operations modifying multiple buffers like rename.
set hidden

" Fix weird filetype for typescript .tsx files
autocmd BufNewFile,BufRead,BufReadPost  *.tsx   set filetype=typescript.tsx

" Fuck your recommended style!
let g:rust_recommended_style = 0

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" LSP base configuration
lua <<EOF
  local cmp = require('cmp')
  cmp.setup({
    completion = {
      autocomplete = true
    },
    mapping = {
      ['<C-Space>'] = cmp.mapping.complete()
      -- ["<S-Tab>"] = cmp.mapping(function()
      --   if cmp.visible() then
      --     cmp.select_prev_item()
      --   elseif vim.fn["vsnip#jumpable"](-1) == 1 then
      --     feedkey("<Plug>(vsnip-jump-prev)", "")
      --   end
      -- end, { "i", "s" }),
    },
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "nvim_lsp:rust_analyzer" },
      { name = "nvim_lsp:rnix" },
      { name = "nvim_lsp:gopls" },
      { name = "nvim_lsp:pylsp" },
      { name = "nvim_lsp:tsserver" },
    },
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
  local lspconfig = require('lspconfig')

  lspconfig.rust_analyzer.setup{
    -- capabilities = capabilities
  }

  -- TODO: Reduce copy-paste here
  lspconfig.pylsp.setup({
    capabilities = capabilities,
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
  })
  lspconfig.gopls.setup{
    capabilities = capabilities
  }
  lspconfig.java_language_server.setup{
    capabilities = capabilities
  }
  lspconfig.tsserver.setup{
    capabilities = capabilities
  }
  lspconfig.clangd.setup{
    capabilities = capabilities
  }
  lspconfig.rnix.setup{
    capabilities = capabilities
  }
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
  vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename)
  vim.keymap.set('n', '<Leader>R', vim.lsp.buf.references)
  vim.keymap.set('n', '<Leader>f', vim.lsp.buf.format)
  vim.keymap.set('n', '<Leader><Leader>', vim.lsp.buf.type_definition)
  vim.keymap.set('n', '<Leader>z', vim.lsp.buf.code_action)
  -- -- vim.keymap.set('n', '<Leader>K', vim.lsp.buf.hover)
  vim.keymap.set('n', '<Leader>x', vim.lsp.codelens.run)
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
