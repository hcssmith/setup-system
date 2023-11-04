#!/usr/bin/env lua

function Main()
  require('env').EnsureEnv()
  local modules = require('modules')
  local bat = require('modules.zsh')
  modules.ProcessModule(bat)
end

Main()
