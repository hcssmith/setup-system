M = {}


M.ProgramName = 'starship'

M.InstallCommands = {
  OpenSuse = 'zypper in starship'
}

M.SetupConfig = function ()
  local util = require('util')
  local paths = require('util.paths')
  util.Copy('./obj/starship.toml', paths.XdgConfig .. 'starship.toml')
end

return M
