return {
  {
  -- The plugin location on GitHub
  "vimwiki/vimwiki",
  -- The event that triggers the plugin
  -- event = "BufEnter *.md",
  -- The keys that trigger the plugin
  -- keys = { "<leader>ww", "<leader>wt" },
  -- The configuration for the plugin
  enabled = true,
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "~/syncthing/Journal/Wiki/",
        syntax = "markdown",
        ext = "md",
        index = "_index"
      },
      {
        path = "~/.nb/home",
        syntax = "markdown",
        ext = "md",
        index = "_index"
      },
    }
    vim.g.vimwiki_global_ext = 0
  end,
}
}
