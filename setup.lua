#!/usr/bin/env lua

function Main()
  local modules = require('modules')
  local zsh = require('modules.zsh')
  local kitty = require('modules.kitty')
  modules.ProcessModule(zsh)
  modules.ProcessModule(kitty)
end

Main()
