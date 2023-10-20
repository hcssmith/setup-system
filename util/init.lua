M = {}

function M.ProgramExists(program)
  local cmd = 'command -v ' .. program
  local handle = assert(io.popen(cmd))
  local result = handle:read("*a")
  print(result)
  handle:close()
  if result:len() > 0 then
    return true
  end
  return false
end

function M.CommandExistsZsh(program)
  local cmd = 'zsh -i -c "command -v ' .. program .. ' "'
  local handle = assert(io.popen(cmd))
  local result = handle:read("*a")
  print(result)
  handle:close()
  if result:len() > 0 then
    return true
  end
  return false
end

local function exists(file)
   local ok, err, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         return true
      end
   end
   return ok, err
end

function M.Exists(file)
  return exists(file)
end

function M.IsDir(path)
   return exists(path.."/")
end


function M.RunCommandZsh(command)
  local cmd = 'zsh -i -c "' .. command .. '"'
  os.execute(cmd)
end

function M.Copy(src, dst)
  local src_contents = io.open(src, 'rb'):read('*a')
  local final = assert(io.open(dst, 'w+b'))
  final:write(src_contents)
end

M.Git = {}

function M.Git.Clone(repo, dst)
  if dst == nil then dst = '.' end
  local cmd = 'git clone ' .. repo .. ' ' .. dst
  os.execute(cmd)
end

function M.Git.Pull(repo)
  local cmd = 'git -C ' .. repo .. ' pull'
  os.execute(cmd)
end

return M
