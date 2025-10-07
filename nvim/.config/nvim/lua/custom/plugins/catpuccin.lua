return {
  'catppuccin/nvim',
  -- enabled = false,
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'auto', -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = 'latte',
        dark = 'frappe',
      },
    }
    vim.cmd.colorscheme 'catppuccin'
  end,
}
