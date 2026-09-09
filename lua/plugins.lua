local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  vim.fn.mkdir(vim.fs.dirname(lazypath), 'p')
  local output = vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    error('Failed to install lazy.nvim:\n' .. output)
  end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'vim-scripts/tComment',
  'easymotion/vim-easymotion',
  'neovim/nvim-lspconfig',
  { 'nvim-treesitter/nvim-treesitter', branch = 'master', build = ':TSUpdate' },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'dcampos/cmp-snippy',
      'dcampos/nvim-snippy',
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        css = { 'prettier' },
        scss = { 'prettier' },
        html = { 'prettier' },
        yaml = { 'prettier' },
        lua = { 'stylua' },
        go = { 'gofmt' },
      },
    },
  },
  {
    'stevearc/oil.nvim',
    cmd = 'Oil',
    opts = {
      keymaps = {
        h = 'actions.parent',
        l = 'actions.select',
      },
    },
    keys = {
      { '<leader>e', '<cmd>Oil<cr>', desc = 'Open parent directory' },
    },
  },
  { dir = vim.fn.expand('~/arcadia/junk/likipiki/cozy') },
  { dir = vim.fn.expand('~/arcadia/devtools/vim/plugin_bundles/signify') },
  { dir = vim.fn.expand('~/arcadia/devtools/vim/plugin_bundles/vcscommand') },
  'morhetz/gruvbox',
  'chriskempson/base16-vim',
  'itchyny/lightline.vim',
  'daviesjamie/vim-base16-lightline',
  'mengelbrecht/lightline-bufferline',
}, {
  defaults = { lazy = false },
  change_detection = { notify = false },
})
