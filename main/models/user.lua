-- main/models/user.lua
local db = require("lapis.db")
local Model = require("lapis.db.model").Model

-- Definición del modelo User
local User = Model:extend("users")

-- Métodos personalizados del modelo User
function User:get_active_users()
  return self:select("WHERE activated = 1")
end

function User:create_user_with_validation(data)
  if not data.name or not data.email then
    return nil, "El nombre y el correo son obligatorios"
  end
  return self:create(data)
end

-- Exporta el modelo User para que pueda ser requerido en otros archivos
return User
