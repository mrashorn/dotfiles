set relativenumber
set nu "row number
set colorcolumn=80
set guicursor= "insert mode block cursor
set hidden "keeps a buffer / window open in background if you change files
set nowrap "the line keeps going off screen
set incsearch "incremental search
set scrolloff=8 "scroll page at bottom 8 lines
set termguicolors
set tabstop=4
set shiftwidth=4
set mouse=a


"remaps
"leader key
let mapleader=" "
nnoremap <leader>n :noh<Cr> 

"Telescope remaps
nnoremap <leader>ff <cmd>Telescope find_files<Cr>
nnoremap <leader>fg <cmd>Telescope live_grep<Cr>



"Plugins
call plug#begin('~/.vim/plugged')
"colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'navarasu/onedark.nvim'
Plug 'sainnhe/sonokai'
Plug 'vv9k/bogster'


"LSP Setup
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer' "Causing nvim to close slowly
Plug 'hrsh7th/cmp-path' "Causing nvim to close slowly.

"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()




"Gruvbox settings
let g:gruvbox_contrast_dark='hard'
"OneDark settings 
let g:onedark_config = {
			\'style': 'darker'
			\}
"Sonokai settings
let g:sonokai_style = 'atlantis'
let g:sonokai_better_performance = 1

"colorschemes 
colorscheme gruvbox
"colorscheme moonfly
"colorscheme nightfly
"colorscheme onedark
"colorscheme sonokai


set completeopt=menu,menuone,noselect

lua << EOF
-- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    mapping = {
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
	  ['<tab>'] = cmp.mapping.select_next_item(),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({
	  --behavior = cmp.ConfirmBehavior.Insert,
	  select = true }), 
    },

    sources = {
      { name = "nvim_lsp", keyword_length = 4 },
	  { name = "buffer", keyword_length = 4},
    }
})

  -- Setup lspconfig for python
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  require('lspconfig').pyright.setup {
    capabilities = capabilities,
	on_attach = function() 
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}) -- normal mode, cap K, calls hover function, current buffer
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) -- normal mode, gd, goes to defn, current buffer, Ctrl-T to jump back
	vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=0}) -- normal mode, gd, goes to type defn, current buffer, Ctrl-T to jump back
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0}) -- normal mode, gd, goes to implementation, current buffer, Ctrl-T to jump back
	end
  }
 -- Set up lspconfig for cpp 
  require('lspconfig').clangd.setup {
    capabilities = capabilities,
	on_attach = function() 
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0}) -- normal mode, cap K, calls hover function, current buffer
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0}) -- normal mode, gd, goes to defn, current buffer, Ctrl-T to jump back
	vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer=0}) -- normal mode, gd, goes to type defn, current buffer, Ctrl-T to jump back
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0}) -- normal mode, gd, goes to implementation, current buffer, Ctrl-T to jump back
	end
	}

-- TreeSitter Setup
  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "cpp", "python", },

    highlight = {
      -- `false` will disable the whole extension
	  enable = true,},
	  }


EOF
