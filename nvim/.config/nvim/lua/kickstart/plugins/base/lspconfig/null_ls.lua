local m = {}

m.mason_dependencies = {
  { 'isort' },
  -- { 'write-good' },
  { 'proselint' },
  -- { 'csharpier' },
}
m.configure = function()
  local nl = require 'null-ls'
  nl.setup {
    sources = {
      nl.builtins.formatting.stylua,
      -- nl.builtins.formatting.black,
      nl.builtins.formatting.isort,
      -- nl.builtins.diagnostics.pylint,
      --
      -- nl.builtins.code_actions.proselint,
      -- nl.builtins.diagnostics.proselint,
      -- nl.builtins.diagnostics.write_good,
      -- nl.builtins.formatting.csharpier,
    },
  }
end

return m
