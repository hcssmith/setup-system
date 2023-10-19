M = {}


M.ProgramName = 'kitty'

M.InstallCommands = {
  OpenSuse = 'zypper in kitty'
}

M.SetupConfig = function ()
  local util = require('util')
  local paths = require('util.paths')
  util.Copy('./obj/kitty.conf', paths.XdgConfig .. 'kitty/kitty.conf')
end

return M
