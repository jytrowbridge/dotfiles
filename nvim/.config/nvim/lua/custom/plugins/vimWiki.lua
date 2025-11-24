return {
  -- The plugin location on GitHub
  'vimwiki/vimwiki',
  -- The event that triggers the plugin
  event = 'BufEnter *.md',
  -- The keys that trigger the plugin
  keys = { '<leader>ww', '<leader>wt' },
  -- The configuration for the plugin
  init = function()
    vim.g.vimwiki_list = {
      {
        path = '~/Documents/Wikis/Wiki/',
        syntax = 'markdown',
        ext = 'md',
        auto_tag = 1,
      },
      {
        path = '~/Documents/Wikis/MediaWiki/',
        syntax = 'markdown',
        ext = 'md',
        auto_tag = 1,
      },
      {
        path = '~/Documents/Wikis/PersonalWiki/',
        syntax = 'markdown',
        ext = 'md',
        auto_tag = 1,
      },
    }
    vim.g.vimwiki_global_ext = 0
  end,
}
