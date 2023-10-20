M = {}

M.InstallCommands = {
  OpenSuse = 'zypper in neovim'
}

M.ProgramName = 'nvim'

M.SetupConfig = function ()
  local util = require('util')
  local path = require('util.paths')
  if util.IsDir(path.XdgConfig .. 'nvim') then
    if util.IsDir(path.XdgConfig .. 'nvim/.git') then
      util.Git.Pull(path.XdgConfig .. 'nvim')
      return
    else
      util.RunCommandZsh('rm -r ' .. path.XdgConfig .. 'nvim')
    end
  end
  util.Git.Clone('https://github.com/hcssmith/nvim-distro', path.XdgConfig .. 'nvim')
end

return M
