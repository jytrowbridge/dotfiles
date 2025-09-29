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
}
