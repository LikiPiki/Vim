-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  local function buf_set_keymap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
  end

  --Enable completion triggered by <c-x><c-o>
  vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', vim.lsp.buf.declaration)
  buf_set_keymap('n', 'gd', vim.lsp.buf.definition)
  buf_set_keymap('n', 'K', vim.lsp.buf.hover)
  buf_set_keymap('n', 'gi', vim.lsp.buf.implementation)
  buf_set_keymap('n', '<C-k>', vim.lsp.buf.signature_help)
  buf_set_keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
  buf_set_keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
  buf_set_keymap('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end)
  buf_set_keymap('n', '<space>D', vim.lsp.buf.type_definition)
  buf_set_keymap('n', '<space>rn', vim.lsp.buf.rename)
  buf_set_keymap('n', '<space>ca', vim.lsp.buf.code_action)
  buf_set_keymap('n', 'gr', vim.lsp.buf.references)
  buf_set_keymap('n', '<space>e', vim.diagnostic.open_float)
  buf_set_keymap('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end)
  buf_set_keymap('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end)
  buf_set_keymap('n', '<space>q', vim.diagnostic.setloclist)
  buf_set_keymap('n', '<space>f', function()
    vim.cmd('silent! LspEslintFixAll')
    require('conform').format({ async = true, lsp_format = 'fallback' })
  end)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local servers = { 'html', 'ts_ls' }
for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  })
  vim.lsp.enable(server)
end

local eslint_on_attach = vim.lsp.config.eslint.on_attach
vim.lsp.config('eslint', {
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = function(client, bufnr)
    if eslint_on_attach then
      eslint_on_attach(client, bufnr)
    end
    on_attach(client, bufnr)

  end,
})
vim.lsp.enable('eslint')

vim.lsp.config('stylelint_lsp', {
  capabilities = capabilities,
  filetypes = { 'css', 'scss' },
  root_markers = { 'package.json' },
  on_attach = on_attach,
  settings = {
    stylelintplus = {
        autoFixOnFormat = true,
    },
  },
})
vim.lsp.enable('stylelint_lsp')
