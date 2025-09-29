-- The following loop will configure each server with the capabilities we defined above.
-- This will ensure that all servers have the same base configuration, but also
-- allow for server-specific overrides.
local function configure_all(servers)
  local capabilities = require('blink.cmp').get_lsp_capabilities()
  for server_name, server_config in pairs(servers) do
    server_config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server_config.capabilities or {})
    vim.lsp.config(server_name, server_config)
    vim.lsp.enable(server_name)
  end
end

return configure_all
