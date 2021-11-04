local lspconfig = require 'lspconfig'
local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
local capabilities = require('cmp_nvim_lsp').update_capabilities(lsp_capabilities)

local servers = {
  'bashls',
  'cssls',
  'gopls',
  'html',
  'jsonls',
  'pyright',
  'svelte',
  'tsserver',
  'vimls',
  'vuels',
  'yamlls',
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities
}
end

-- efm-langserver diagnostics
local black = { formatCommand = 'black -', formatStdin = true }
local isort = { formatCommand = 'isort --profile black -', formatStdin = true }
local flake8 = {
    lintCommand = 'flake8 --max-doc-length 72 --max-line-length 88 --extend-ignore=E203 --stdin-display-name ${INPUT} -',
    lintStdin = true,
    lintFormats = { '%f:%l:%c: %m' },
    lintSource = 'flake8',
}
local mypy = {
    lintCommand = 'mypy --show-column-numbers --disallow-any-generics --disallow-untyped-def --ignore-missing-imports',
    lintFormats = {
        '%f:%l:%c: %trror: %m',
        '%f:%l:%c: %tarning: %m',
        '%f:%l:%c: %tote: %m',
    },
    lintSource = 'mypy',
}
local golangciLint = { lintCommand = "golangci-lint run", lintSource = "golangci-lint" }
local stylua = { formatCommand = "stylua -", formatStdin = true }

lspconfig.efm.setup{
  init_options = { documentFormatting = true },
  settings = {
    rootMarkers = { '.git/' },
    languages = {
      go = { golangciLint },
      python = { black, isort, flake8, mypy },
      lua = { stylua },
    },
  },
}

-- sumneko language server
local sumneko_binary = "/usr/bin/lua-language-server"
local sumneko_main = "/usr/lib/lua-language-server/main.lua"

lspconfig.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_main},
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';')
      },
      diagnostics = {
        globals = {'vim'}
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        }
      }
    }
  }
}
