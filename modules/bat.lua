M = {}


M.ProgramName = 'bat'

M.InstallCommands = {
  OS = {
    OpenSuse = 'zypper in bat'
  },
  Source = {
    repo = 'https://github.com/sharkdp/bat',
    build = 'cargo build',
    instal = 'cargo install'
  }
}

return M
