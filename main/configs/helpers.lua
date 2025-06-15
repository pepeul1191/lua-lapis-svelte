-- app/configs/helpers.lua
local helpers = {}

function helpers.mayusculas(str)
  return string.upper(str)
end

-- Funciones auxiliares globales
function helpers.greet(name)
  return "Hola, " .. name .. "!"
end

function helpers.dump(tbl, indent)
  indent = indent or 0
  local buffer = {} -- Aquí almacenamos todas las líneas

  local function append(str)
    buffer[#buffer + 1] = str
  end

  local function dump(tbl, indent)
    local indentStr = string.rep("  ", indent)
    if type(tbl) ~= "table" then
      append(indentStr .. tostring(tbl))
      return
    end
    for k, v in pairs(tbl) do
      local keyStr = tostring(k)
      if type(v) == "table" then
        append(indentStr .. keyStr .. " = {")
        dump(v, indent + 1)
        append(indentStr .. "}")
      else
        append(indentStr .. keyStr .. " = " .. tostring(v))
      end
    end
  end
  dump(tbl, indent)
  return table.concat(buffer, "\n")
end

return helpers
