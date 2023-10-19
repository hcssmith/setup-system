M = {}

function M.ProgramExists(program)
  local cmd = 'command -v ' .. program
  local handle = assert(io.popen(cmd))
  local result = handle:read("*a")
  handle:close()
  if result:len() > 0 then
    return true
  end
  return false
end

function M.Copy(src, dst)
  local src_contents = io.open(src, 'rb'):read('*a')
  local final = assert(io.open(dst, 'w+b'))
  final:write(src_contents)
end

return M
