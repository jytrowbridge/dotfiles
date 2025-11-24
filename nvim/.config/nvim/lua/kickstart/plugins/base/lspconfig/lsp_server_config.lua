return {
  pyright = {
    settings = {
      pyright = {
        -- Using Ruff's import organizer
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          -- Ignore all files for analysis to exclusively use Ruff for linting
          -- ignore = { '*' },
        },
      },
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  ruff = {
    init_options = {
      settings = {
        lineLength = 88,
        fix = true,
        organizeImports = true,
        lint = {
          select = { 'E', 'F', 'N', 'C4', 'B', 'TID', 'I' },
        },
      },
    },
  },
  ltex = {
    cmd_env = { JAVA_OPTS = '-Djdk.xml.totalEntitySizeLimit=0' },
    enabled = false,
    settings = {
      ltex = {
        -- checkFrequency = 'save',
        diagnosticsDelay = 2,
        sentenceCacheSize = 10000,
        -- language = 'en-US',
      },
    },
  },
  texlab = {},
  -- roslyn = {},
  -- settings = {
  --   filetypes = { 'cs' },
  --   ['csharp|inlay_hints'] = {
  --     csharp_enable_inlay_hints_for_implicit_object_creation = true,
  --     csharp_enable_inlay_hints_for_implicit_variable_types = true,
  --   },
  --   ['csharp|code_lens'] = {
  --     dotnet_enable_references_code_lens = true,
  --   },
  -- },
  -- },
  -- omnisharp = {},
}
