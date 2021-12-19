local lspconfig = require 'lspconfig'
local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').update_capabilities(lsp_capabilities)

local on_attach = function()
  vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()'
end

-- null-ls
local null_ls = require 'null-ls'
local b = null_ls.builtins

null_ls.setup {
  sources = {
    b.code_actions.gitsigns,
    -- b.code_actions.refactoring,
    b.diagnostics.shellcheck,
    b.diagnostics.flake8.with {
      extra_args = {
        '--max-doc-length=72',
        '--max-line-length=88',
        '--extend-ignore=E203',
      },
    },
    -- b.diagnostics.mypy.with {
    --   args = {
    --     "--show-column-numbers",
    --     "--disallow-any-generics",
    --     "--disallow-untyped-def",
    --     "--ignore-missing-imports",
    --   },
    -- },
    b.formatting.black,
    b.formatting.isort,
    -- b.formatting.prettier,
    b.formatting.stylua.with {
      extra_args = {
        '--config-path',
        vim.fn.expand '~/.config/stylua/stylua.toml',
      },
    },
    -- b.formatting.trim_newlines.with {
    --   filetypes = { "lua", }
    -- },
    -- b.formatting.trim_whitespace.with {
    --   filetypes = { "lua", }
    -- },
  },
  on_attach = on_attach,
}

local servers = {
  'bashls',
  'cssls',
  'gopls',
  'html',
  'jsonls',
  'null-ls',
  'pyright',
  'svelte',
  'tsserver',
  'vimls',
  'vuels',
  'yamlls',
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end

-- sumneko language server
local sumneko_binary = '/usr/bin/lua-language-server'
local sumneko_main = '/usr/lib/lua-language-server/main.lua'

lspconfig.sumneko_lua.setup {
  cmd = { sumneko_binary, '-E', sumneko_main },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [vim.fn.expand '$VIMRUNTIME/lua'] = true,
          [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
