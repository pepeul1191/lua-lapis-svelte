-- app/configs/helpers.lua
local helpers = {}

function helpers.mayusculas(str)
  return string.upper(str)
end

-- Funciones auxiliares globales
function helpers.greet(name)
  return "Hola, " .. name .. "!"
end

return helpers