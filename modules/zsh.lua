M = {}


M.ProgramName = 'zsh'

M.InstallCommands = {
  OpenSuse = 'zypper in zsh'
}

M.SetupConfig = function ()
  local util = require('util')
  local paths = require('util.paths')
  if util.CommandExistsZsh('omz') then
    print('found omz')
    util.RunCommandZsh('omz update')
  else
    os.execute([[sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"]])
  end
  util.Copy('./obj/zshrc', paths.Home .. '.zshrc')
end

return M
