local _M = {}

function _M.check_type(t, ...)
  -- Throws an error in caller function when any of supplied arguments
  -- has a type different from description in first string argument
  if type(t) ~= "string"
  then
    error("Supplied type description if not a string!")
  end
  for i, v in pairs({...})
  do
    if type(v) ~= t
    then
      error("Argument №"..tostring(i).." with value \""..tostring(v)..
        "\" is not a "..t.."!", 1)
    end
  end
end

function _M.check_executable(exe)
  return (nil ~= io.popen(exe.. " -v"):read('*all'))
end

function _M.file_exists(filename)
  local f = open(filename, "r")
  if f ~= nil
  then
    f:close()
    return true
  end
  return false
end

return _M
