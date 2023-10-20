M = {}

function M.EnsureEnv()
  local paths = require('util.paths')
  os.execute('mkdir ' .. paths.Home .. 'Projects')
end

return M
