M = {}

M.ProcessModule = function (module)
  local util = require('util')
  print('Checking if ' .. module.ProgramName .. ' is installed.')
  if not util.ProgramExists(module.ProgramName) then
    print('Finding OS type')
    if os.getenv('VENDOR') == 'suse' then
      print('Installing on OpenSuse')
      os.execute(module.InstallCommands.OpenSuse)
    end
  end
  print('Setting up config')
  if module.SetupConfig ~= nil then
    module.SetupConfig()
  end
end

return M
