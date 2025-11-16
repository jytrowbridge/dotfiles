return {
  'neovim/nvim-lspconfig',
  enabled = false,
  dependencies = {
    {
      'mason-org/mason.nvim',
      opts = {
        registries = {
          'github:mason-org/mason-registry',
          'github:Crashdummyy/mason-registry',
        },
      },
    },
    { 'j-hui/fidget.nvim', opts = {} },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'nvimtools/none-ls.nvim',
    'nvim-lua/plenary.nvim',
    'saghen/blink.cmp',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local create_mappings = require 'kickstart.plugins.base.lspconfig.mappings'
        create_mappings(event)

        local create_aucmd = require 'kickstart.plugins.base.lspconfig.autocommands'
        create_aucmd(event)
      end,
    })

    local create_diag_cfg = require 'kickstart.plugins.base.lspconfig.diagnostics'
    create_diag_cfg()

    local lsp_server_config = require 'kickstart.plugins.base.lspconfig.lsp_server_config'

    local null_ls = require 'kickstart.plugins.base.lspconfig.null_ls'

    local installer = require 'kickstart.plugins.base.lspconfig.mason_tool_installer'
    -- installer(vim.tbl_keys(lsp_server_config))
    installer(vim.list_extend(vim.tbl_keys(lsp_server_config), null_ls.mason_dependencies))

    local configure_lsps = require 'kickstart.plugins.base.lspconfig.config_all'
    configure_lsps(lsp_server_config)

    null_ls.configure()
  end,
}
