-- The following loop will configure each server with the capabilities we defined above.
-- This will ensure that all servers have the same base configuration, but also
-- allow for server-specific overrides.
local function configure_all(servers)
  local capabilities = require('blink.cmp').get_lsp_capabilities()
  for server_name, server_config in pairs(servers) do
    server_config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server_config.capabilities or {})
    vim.lsp.config(server_name, server_config or {})
    vim.lsp.enable(server_name)
  end

  vim.lsp.config('roslyn', {
    on_attach = function()
      print 'This will run when the server attaches!'
    end,
    settings = {
      ['csharp|inlay_hints'] = {
        csharp_enable_inlay_hints_for_implicit_object_creation = true,
        csharp_enable_inlay_hints_for_implicit_variable_types = true,
      },
      ['csharp|code_lens'] = {
        dotnet_enable_references_code_lens = true,
      },
    },
  })
end

return configure_all
