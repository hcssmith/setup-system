M = {}


M.ProgramName = 'zsh'

M.InstallCommands = {
  OpenSuse = 'zypper in zsh'
}

M.SetupConfig = function ()
  local util = require('util')
  local paths = require('util.paths')
  util.Copy('./obj/zshrc', paths.Home .. '.zshrc')
end

return M
