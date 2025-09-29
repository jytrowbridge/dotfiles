local function install_all(tools)
  require('mason-tool-installer').setup { ensure_installed = tools }
end

return install_all
