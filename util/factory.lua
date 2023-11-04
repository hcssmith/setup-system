Factory = {}

Factory.ObjectBase = {}

Factory.Table = {}

function Factory.Table.DeepCopy(o, seen)
  local deepcopy = Factory.Table.DeepCopy
  seen = seen or {}
  if o == nil then return nil end
  if seen[o] then return seen[o] end


  local no = {}
  seen[o] = no
  setmetatable(no, deepcopy(getmetatable(o), seen))

  for k, v in next, o, nil do
    k = (type(k) == 'table') and k:deepcopy(seen) or k
    v = (type(v) == 'table') and v:deepcopy(seen) or v
    no[k] = v
  end
  return no
end


function Factory.New(base, init_args)
  local o = init_args or {}
  o._base = Factory.Table.DeepCopy(base)
  o._obj = Factory.Table.DeepCopy(Factory.ObjectBase)

  setmetatable(o,
    {
    __index = function (self, key)
      local v = rawget(self, key)
      if v ~= nil then return v end
      if self._base[key] then return self._base[key] end
      if self._obj[key] then return self._obj[key] end
      return nil
    end}
  )
  return o
end

return Factory
