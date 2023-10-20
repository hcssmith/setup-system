#!/usr/bin/env lua

function Main()
  require('env').EnsureEnv()
  local modules = require('modules')
  local zsh = require('modules.zsh')
  local kitty = require('modules.kitty')
  local starship = require('modules.starship')
  local neovim = require('modules.neovim')
  modules.ProcessModule(zsh)
  modules.ProcessModule(kitty)
  modules.ProcessModule(starship)
  modules.ProcessModule(neovim)
end

Main()
